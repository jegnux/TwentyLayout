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
        layout.constraints.append(constraint)
    }

    internal var constraints: [Constraint] = []
    
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
        UIView.firstCommonAncestor(of: constraints.flatMap { [$0.lhs.item.object, $0.rhs.object] })
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
