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
        
    internal static func push(_ constraint: Constraint?) {
        guard let constraint = constraint else {
            return
        }
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

    internal let constraints: [Constraint]
    
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
    
    public func activate() {
        for constraint in constraints {
            if let layoutConstraint = map[constraint] {
                layoutConstraint.isActive = true
            } else {
                let layoutConstraint = constraint.makeNSLayoutConstraint()
                layoutConstraint.isActive = true
                map[constraint] = layoutConstraint
            }
        }
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

extension Constraint {
    internal func makeNSLayoutConstraint() -> NSLayoutConstraint {
        
        let lhsView = lhs.item.object as? UIView
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
            item: lhs.item.object,
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
