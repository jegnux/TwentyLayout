//
//  Created by Jérôme Alves on 06/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public final class Layout: CustomStringConvertible {
    
    private static var layoutStack: [Layout] = []

    internal static func push(_ constraint: Constraint?) {
        guard let constraint = constraint else {
            return
        }
        guard let layout = layoutStack.last else {
            assertionFailure("Constraints MUST be created as part of a Layout { ... }")
            return
        }
        layout.add(constraint)
    }
    
    public init(_ make: () -> Void) {
        Layout.layoutStack.append(self)
        make()
        Layout.layoutStack.removeLast()
    }
    
    @discardableResult
    public static func activate(_ make: () -> Void) -> Layout {
        let layout = Layout(make)
        layout.activate()
        return layout
    }
    
    public var description: String {
        constraints.map { $0.description }.joined(separator: "\n")
    }

    internal func add(_ constraint: Constraint) {
        if constraints.insert(constraint).inserted {
            orderedConstraints.append(constraint)
            constraintsToLayoutConstraints[constraint] = Weak(nil)
            constraintsByReuseIdentifier[constraint.reuseIdentifier, default:[]].insert(constraint)
        }
    }
    
    internal var constraints: Set<Constraint> = []
    internal var orderedConstraints: [Constraint] = []
    private var constraintsToLayoutConstraints: [Constraint: Weak<NSLayoutConstraint>] = [:]
    private var constraintsByReuseIdentifier: [Int: Set<Constraint>] = [:]
    
    internal var layoutConstraints: [NSLayoutConstraint?] {
        orderedConstraints.map { constraintsToLayoutConstraints[$0]?.object }
    }
    
    private func layoutConstraint(for constraint: Constraint) -> NSLayoutConstraint? {
        constraintsToLayoutConstraints[constraint]?.object
    }

    private func setLayoutConstraint(_ layoutConstraint: NSLayoutConstraint?, for constraint: Constraint) {
        constraintsToLayoutConstraints[constraint, default: Weak(nil)].object = layoutConstraint
    }

    @discardableResult
    internal func updateOrCreateLayoutConstraint(for constraint: Constraint) -> (layoutConstraint: NSLayoutConstraint, created: Bool)? {
        if let layoutConstraint = layoutConstraint(for: constraint) {
            return (layoutConstraint, false)
        } else if let layoutConstraint = constraint.makeNSLayoutConstraint() {
            setLayoutConstraint(layoutConstraint, for: constraint)
            return (layoutConstraint, true)
        }
        return nil
    }
    
    private func constraint(updatableFrom otherConstraint: Constraint, in reuseBag: inout [Int: Set<Constraint>]) -> Constraint? {
        guard var set = reuseBag[otherConstraint.reuseIdentifier],
            let constraint = set.first(where: otherConstraint.canUpdate(to:))
            else { return nil }
        
        set.remove(constraint)
        reuseBag[otherConstraint.reuseIdentifier] = set
        return constraint
    }
        
    internal func importLayoutConstraint(from otherConstraint: Constraint, in layout: Layout, using reuseBag: inout [Int: Set<Constraint>]) -> (constraint: Constraint, layoutConstraint: NSLayoutConstraint)? {
        guard let layoutConstraint = layout.layoutConstraint(for: otherConstraint) else {
            return nil
        }
        guard let constraint = constraint(updatableFrom: otherConstraint, in: &reuseBag) else {
            return nil
        }
        layoutConstraint.constant = constraint.rhs.dimension ?? constraint.constant ?? 0
        layoutConstraint.priority = constraint.priority ?? .required

        layout.setLayoutConstraint(nil, for: otherConstraint)
        setLayoutConstraint(layoutConstraint, for: constraint)
        
        return (constraint, layoutConstraint)
    }
    
    public func activate() {
        constraints
            .compactMap(updateOrCreateLayoutConstraint)
            .forEach { $0.layoutConstraint.isActive = true }
    }
    
    public func deactivate() {
        constraintsToLayoutConstraints.forEach {
            $0.value.object?.isActive = false
        }
    }
    
    public var firstCommonAncestor: UIView? {
        UIView.firstCommonAncestor(of: constraints.flatMap { [$0.lhs.item.object, $0.rhs.object] })
    }
        
    public static func update(from oldLayout: Layout?, to newLayout: Layout?) {
        switch (oldLayout, newLayout) {
        case (let old?, nil):
            old.deactivate()
            
        case (let old?, let new?):
    
            var newConstraints = new.constraints
            var reuseBag = new.constraintsByReuseIdentifier
            
            for constraint in old.constraints {
                if let result = new.importLayoutConstraint(from: constraint, in: old, using: &reuseBag) {
                    result.layoutConstraint.isActive = true
                    newConstraints.remove(result.constraint)
                } else {
                    old.layoutConstraint(for: constraint)?.isActive = false
                }
            }
                        
            newConstraints
                .compactMap(new.updateOrCreateLayoutConstraint)
                .forEach { $0.layoutConstraint.isActive = true }
            
        case (nil, let new?):
            new.activate()
            
        case (nil, nil):
            break
        }
        let firstCommonAncestor = UIView.firstCommonAncestor(
            between: oldLayout?.firstCommonAncestor,
            and: newLayout?.firstCommonAncestor
        )
        if UIView.inheritedAnimationDuration > 0, let animatableView = firstCommonAncestor {
            animatableView.layoutIfNeeded()
        }
    }
    
    @discardableResult
    public static func update(from oldLayout: Layout?, to makeNewLayout: () -> Void) -> Layout {
        let newLayout = Layout(makeNewLayout)
        Layout.update(from: oldLayout, to: newLayout)
        return newLayout
    }
    
    @discardableResult
    public func update(to newLayout: Layout) -> Layout {
        Layout.update(from: self, to: newLayout)
        return newLayout
    }
    
    @discardableResult
    public func update(to newLayout: Layout?) -> Layout? {
        Layout.update(from: self, to: newLayout)
        return newLayout
    }
    
    @discardableResult
    public func update(to makeNewLayout: () -> Void) -> Layout {
        let newLayout = Layout(makeNewLayout)
        Layout.update(from: self, to: newLayout)
        return newLayout
    }
    
}

internal class Weak<T: AnyObject> {
    weak var object: T?
    init(_ object: T?) {
        self.object = object
    }
}

extension Constraint {
    internal func makeNSLayoutConstraint() -> NSLayoutConstraint? {
        guard let lhsObject = lhs.item.object else {
            return nil
        }
        
        let lhsView = lhsObject as? UIView
        let rhsView = rhs.object as? UIView
        switch (lhsView, rhsView) {
        case (nil, nil):
            break
        case (let lhsView?, nil):
            lhsView.translatesAutoresizingMaskIntoConstraints = false
        case (nil, let rhsView?):
            rhsView.translatesAutoresizingMaskIntoConstraints = false
        case (let lhsView?, let rhsView?):
            if lhsView.isDescendant(of: rhsView) == false {
                rhsView.translatesAutoresizingMaskIntoConstraints = false
            }
            if rhsView.isDescendant(of: lhsView) == false {
                lhsView.translatesAutoresizingMaskIntoConstraints = false
            }
        }

        let layoutConstraint = NSLayoutConstraint(
            item: lhsObject,
            attribute: lhs.constraintAttribute,
            relatedBy: relation,
            toItem: rhs.object,
            attribute: rhs.constraintAttribute,
            multiplier: multiplier ?? 1,
            constant: rhs.dimension ?? constant ?? 0
        )
        layoutConstraint.priority = priority ?? .required
        return layoutConstraint
    }
    
}
