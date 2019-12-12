//
//  Created by Jérôme Alves on 06/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

private var buffer: [Int: [Constraint]] = [:]

public final class Layout: CustomStringConvertible {
    
    private static func beginUpdates() {
        buffer[buffer.count] = []
    }
    
    internal static func push<LHSBase, RHSBase, LHSAttribute, RHSAttribute>(
        _ lhs: SingleAnchor<LHSBase, LHSAttribute>?,
        _ relation: NSLayoutConstraint.Relation?,
        _ rhs: SingleAnchor<RHSBase, RHSAttribute>?
    ) where
        LHSAttribute.Axis == RHSAttribute.Axis,
        LHSAttribute.Kind: PositionAttributeKind,
        RHSAttribute.Kind: PositionAttributeKind
    {
        guard let lhs = lhs, let relation = relation, let rhs = rhs else {
            return
        }
        push(.init(lhs, relation, rhs))
    }

    internal static func push<LHSBase, RHSBase, LHSAttribute, RHSAttribute>(
        _ lhs: SingleAnchor<LHSBase, LHSAttribute>?,
        _ relation: NSLayoutConstraint.Relation?,
        _ rhs: SingleAnchor<RHSBase, RHSAttribute>?
    ) where
        LHSAttribute.Kind: DimensionAttributeKind,
        RHSAttribute.Kind: DimensionAttributeKind
    {
        guard let lhs = lhs, let relation = relation, let rhs = rhs else {
            return
        }
        push(.init(lhs, relation, rhs))
    }

    internal static func push<LHSBase: Constrainable, RHSBase: Constrainable>(
        _ lhs: LHSBase?,
        _ lhsAttribute: NSLayoutConstraint.Attribute?,
        _ relation: NSLayoutConstraint.Relation?,
        _ rhs: RHSBase?,
        _ rhsAttribute: NSLayoutConstraint.Attribute?,
        _ constraintProperties: ConstraintProperties? = nil
    )
    {
        guard let lhs = lhs, let lhsAttribute = lhsAttribute, let relation = relation, let rhs = rhs, let rhsAttribute = rhsAttribute else {
            return
        }
        push(.init(lhs, lhsAttribute, relation, rhs, rhsAttribute, constraintProperties))
    }
    
    internal static func push<LHSBase, RHSBase: Constrainable, T>(
        _ lhs: SingleAnchor<LHSBase, T>?,
        _ relation: NSLayoutConstraint.Relation?,
        _ rhs: RHSBase?
    ) where
        T.Kind: PositionAttributeKind
    {
        push(lhs, relation, lhs?.on(rhs))
    }

    internal static func push<LHSBase, RHSBase: Constrainable, T>(
        _ lhs: SingleAnchor<LHSBase, T>?,
        _ relation: NSLayoutConstraint.Relation?,
        _ rhs: RHSBase?
    ) where
        T.Kind: DimensionAttributeKind
    {
        push(lhs, relation, lhs?.on(rhs))
    }

    internal static func push<LHSBase, RHSBase, T>(
        _ lhs: SingleAnchor<LHSBase, T>?,
        _ relation: NSLayoutConstraint.Relation?,
        _ rhs: ModifiableConstraintItem<RHSBase>?
    ) where
        T.Kind: PositionAttributeKind
    {
        push(lhs, relation, lhs?.on(rhs))
    }
    
    public static func push<LHSBase, RHSBase: Constrainable, T>(
        _ lhs: SingleAnchor<LHSBase, T>?,
        _ relation: NSLayoutConstraint.Relation?,
        _ rhs: KeyPath<LHSBase, RHSBase?>
    ) where
        T.Kind: PositionAttributeKind
    {
        Layout.push(lhs, .equal, lhs?.on(rhs))
    }
    
    public static func push<LHSBase, RHSBase: Constrainable, T>(
        _ lhs: SingleAnchor<LHSBase, T>?,
        _ relation: NSLayoutConstraint.Relation?,
        _ rhs: ModifiableKeyPath<LHSBase, RHSBase?>?
    ) where
        T.Kind: PositionAttributeKind
    {
        Layout.push(lhs, .equal, lhs?.on(rhs))
    }

    internal static func push(_ constraint: Constraint) {
        let index = buffer.count - 1
        guard index >= 0 else {
            assertionFailure("Constraints MUST be created as part of a Layout { ... }")
            return
        }
        buffer[index, default: []].append(constraint)
    }

    private static func endUpdates() -> [Constraint] {
        return buffer.removeValue(forKey: buffer.count - 1) ?? []
    }

    public let constraints: [Constraint]
    
    public init(_ make: () -> Void) {
        Layout.beginUpdates()
        make()
        constraints = Layout.endUpdates()
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
    
    private var map: [Constraint: NSLayoutConstraint] = [:]
    
    private func makeLayoutConstraint(constraint: Constraint) -> NSLayoutConstraint {
        
        let lhsView = constraint.lhs.item.object as? UIView
        let rhsView = constraint.rhs.object as? UIView
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
            item: constraint.lhs.item.object,
            attribute: constraint.lhs.constraintAttribute,
            relatedBy: constraint.relation,
            toItem: constraint.rhs.object,
            attribute: constraint.rhs.constraintAttribute,
            multiplier: constraint.constraintProperties.multiplier ?? 1,
            constant: constraint.rhs.dimension ?? constraint.constraintProperties.constant ?? 0
        )
        layoutConstraint.priority = constraint.constraintProperties.priority ?? .required
        return layoutConstraint
    }
    
    public func activate() {
        for constraint in constraints {
            if let layoutConstraint = map[constraint] {
                layoutConstraint.isActive = true
            } else {
                let layoutConstraint = makeLayoutConstraint(constraint: constraint)
                layoutConstraint.isActive = true
                map[constraint] = layoutConstraint
            }
        }
        print(map)
    }
    
    public func deactivate() {
        map.values.forEach { $0.isActive = false }
    }
    
    public var firstCommonAncestor: UIView? {
        var view: UIView?
        for constraint in constraints {
            view = UIView.firstCommonAncestor(between: view, and: constraint.lhs.item.object)
            view = UIView.firstCommonAncestor(between: view, and: constraint.rhs.object)
        }
        return view
    }
}
