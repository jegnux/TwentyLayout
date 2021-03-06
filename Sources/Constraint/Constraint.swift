//
//  Created by Jérôme Alves on 06/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

internal struct Constraint: Hashable, CustomStringConvertible {

    internal enum Operand: Hashable, CustomStringConvertible {
        case expression(ConstraintExpression)
        case dimension(CGFloat)
        
        internal var description: String {
            switch self {
            case .expression(let expression):
                return expression.item.description + expression.constraintAttribute.alp_description
            case .dimension(let dimension):
                return "\(dimension)"
            }
        }
        
        internal var expression: ConstraintExpression? {
            switch self {
            case .expression(let expression):
                return expression
            case .dimension:
                return nil
            }
        }
        
        internal var object: AnyObject? {
            expression?.item.object
        }
        
        internal var dimension: CGFloat? {
            switch self {
            case .expression:
                return nil
            case .dimension(let dimension):
                return dimension
            }
        }

        internal var constraintAttribute: NSLayoutConstraint.Attribute {
            switch self {
            case .expression(let expression):
                return expression.constraintAttribute
            case .dimension:
                return .notAnAttribute
            }
        }

        internal func canUpdate(to otherOperand: Operand) -> Bool {
            switch (self, otherOperand) {
            case (.dimension, .dimension): return true
            case (.expression(let lhs), .expression(let rhs)): return lhs == rhs
            default: return false
            }
        }
    }
    internal let lhs: ConstraintExpression
    internal let relation: NSLayoutConstraint.Relation
    internal let rhs: Operand
    internal let constant: CGFloat?
    internal let multiplier: CGFloat?
    internal let priority: UILayoutPriority?
    
    internal var reuseIdentifier: Int {
        var hasher = Hasher()
        hasher.combine(lhs.item.object.map { ObjectIdentifier($0).hashValue })
        hasher.combine(lhs.constraintAttribute)
        hasher.combine(relation)
        hasher.combine(rhs.object.map { ObjectIdentifier($0).hashValue })
        hasher.combine(rhs.constraintAttribute)
        hasher.combine(multiplier ?? 1)
        return hasher.finalize()
    }
        
    internal init?<LHSBase, LHSAttribute, RHS: ConstraintOperand, RHSBase, RHSAttribute>(
        _ lhs: SingleAnchor<LHSBase, LHSAttribute>?,
        _ relation: NSLayoutConstraint.Relation?,
        _ rhs: RHS?
    )
        where
        RHS.Value == SingleAnchor<RHSBase, RHSAttribute>
    {
        guard let lhs = lhs, let relation = relation, let rhs = rhs else {
            return nil
        }
        self.lhs = ConstraintExpression(lhs)
        self.relation = relation
        self.rhs = .expression(ConstraintExpression(rhs.constraintValue))
        self.constant = rhs.constant(for: rhs.constraintValue.constraintAttribute)
        self.multiplier = rhs.multiplier
        self.priority = rhs.priority
    }
    
    internal init?<LHSBase, LHSAttribute, RHS: ConstraintOperand>(
        _ lhs: SingleAnchor<LHSBase, LHSAttribute>?,
        _ relation: NSLayoutConstraint.Relation?,
        _ rhs: RHS?
    ) where
        RHS.Value : Constrainable
    {
        guard let lhs = lhs, let relation = relation, let rhs = rhs, let rhsAnchor = lhs.on(rhs.constraintValue) else {
            return nil
        }
        self.lhs = ConstraintExpression(lhs)
        self.relation = relation
        self.rhs = .expression(ConstraintExpression(rhsAnchor))
        self.constant = rhs.constant(for: rhsAnchor.constraintAttribute)
        self.multiplier = rhs.multiplier
        self.priority = rhs.priority
    }

    internal init?<LHSBase, LHSAttribute, RHS: ConstraintOperand, RHSBase: Constrainable>(
        _ lhs: SingleAnchor<LHSBase, LHSAttribute>?,
        _ relation: NSLayoutConstraint.Relation?,
        _ rhs: RHS?
    ) where
        RHS.Value : KeyPath<LHSBase, RHSBase?>
    {
        guard let lhs = lhs, let relation = relation, let rhs = rhs, let rhsAnchor = lhs.on(rhs.constraintValue) else {
            return nil
        }
        self.lhs = ConstraintExpression(lhs)
        self.relation = relation
        self.rhs = .expression(ConstraintExpression(rhsAnchor))
        self.constant = rhs.constant(for: rhsAnchor.constraintAttribute)
        self.multiplier = rhs.multiplier
        self.priority = rhs.priority
    }

    internal init?<LHSBase, LHSAttribute, RHS: ConstraintOperand, RHSBase: Constrainable>(
        _ lhs: SingleAnchor<LHSBase, LHSAttribute>?,
        _ relation: NSLayoutConstraint.Relation?,
        _ rhs: RHS?
    ) where
        RHS.Value : KeyPath<LHSBase, RHSBase>
    {
        guard let lhs = lhs, let relation = relation, let rhs = rhs, let rhsAnchor = lhs.on(rhs.constraintValue) else {
            return nil
        }
        self.lhs = ConstraintExpression(lhs)
        self.relation = relation
        self.rhs = .expression(ConstraintExpression(rhsAnchor))
        self.constant = rhs.constant(for: rhsAnchor.constraintAttribute)
        self.multiplier = rhs.multiplier
        self.priority = rhs.priority
    }

    internal init?<LHSBase, LHSAttribute, RHS: ConstraintOperand, RHSBase, RHSAttribute: ConstraintOperand>(
        _ lhs: SingleAnchor<LHSBase, LHSAttribute>?,
        _ relation: NSLayoutConstraint.Relation?,
        _ rhs: RHS?
    ) where
        RHS.Value == KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>>
    {
        guard let lhs = lhs, let relation = relation, let rhs = rhs else {
            return nil
        }
        let rhsAnchor = lhs.item[keyPath: rhs.constraintValue]
        self.lhs = ConstraintExpression(lhs)
        self.relation = relation
        self.rhs = .expression(ConstraintExpression(rhsAnchor))
        self.constant = rhs.constant(for: rhsAnchor.constraintAttribute)
        self.multiplier = rhs.multiplier
        self.priority = rhs.priority
    }
    
    internal init?<LHSBase, LHSAttribute, RHS: ConstraintOperand, RHSBase, RHSAttribute: ConstraintOperand>(
        _ lhs: SingleAnchor<LHSBase, LHSAttribute>?,
        _ relation: NSLayoutConstraint.Relation?,
        _ rhs: RHS?
    ) where
        RHS.Value == KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>?>
    {
        guard let lhs = lhs, let relation = relation, let rhs = rhs, let rhsAnchor = lhs.item[keyPath: rhs.constraintValue] else {
            return nil
        }
        self.lhs = ConstraintExpression(lhs)
        self.relation = relation
        self.rhs = .expression(ConstraintExpression(rhsAnchor))
        self.constant = rhs.constant(for: rhsAnchor.constraintAttribute)
        self.multiplier = rhs.multiplier
        self.priority = rhs.priority
    }

    internal init?<LHSBase, LHSAttribute, RHS: ConstraintOperand, RHSAttribute>(
        _ lhs: SingleAnchor<LHSBase, LHSAttribute>?,
        _ relation: NSLayoutConstraint.Relation?,
        _ rhs: RHS?
    ) where
        RHS.Value == KeyPath<Anchors<LHSBase>, SingleAnchor<LHSBase, RHSAttribute>>
    {
        guard let lhs = lhs, let relation = relation, let rhs = rhs else {
            return nil
        }
        let rhsAnchor = Anchors(lhs.item)[keyPath: rhs.constraintValue]
        self.lhs = ConstraintExpression(lhs)
        self.relation = relation
        self.rhs = .expression(ConstraintExpression(rhsAnchor))
        self.constant = rhs.constant(for: rhsAnchor.constraintAttribute)
        self.multiplier = rhs.multiplier
        self.priority = rhs.priority
    }

    internal init?<LHSBase: Constrainable, RHS: ConstraintOperand>(
        _ lhs: LHSBase,
        _ lhsAttribute: NSLayoutConstraint.Attribute,
        _ relation: NSLayoutConstraint.Relation,
        _ rhs: RHS?,
        _ rhsAttribute: NSLayoutConstraint.Attribute
    ) where
        RHS.Value : Constrainable
    {
        guard let rhs = rhs else {
            return nil
        }
        self.lhs = ConstraintExpression(lhs, lhsAttribute)
        self.relation = relation
        self.rhs = .expression(ConstraintExpression(rhs.constraintValue, rhsAttribute))
        self.constant = rhs.constant(for: rhsAttribute)
        self.multiplier = rhs.multiplier
        self.priority = rhs.priority
    }

    internal init?(
        _ lhs: AnyObject?,
        _ lhsAttribute: NSLayoutConstraint.Attribute,
        _ relation: NSLayoutConstraint.Relation?,
        _ rhs: AnyObject?,
        _ rhsAttribute: NSLayoutConstraint.Attribute,
        constant: CGFloat? = nil,
        multiplier: CGFloat? = nil,
        priority: UILayoutPriority? = nil
    ) {
        guard let lhs = lhs, let relation = relation, let rhs = rhs else {
            return nil
        }
        self.lhs = ConstraintExpression(lhs, lhsAttribute)
        self.relation = relation
        self.rhs = .expression(ConstraintExpression(rhs, rhsAttribute))
        self.constant = constant
        self.multiplier = multiplier
        self.priority = priority
    }

    internal init?(
        _ lhs: AnyObject?,
        _ lhsAttribute: NSLayoutConstraint.Attribute,
        _ relation: NSLayoutConstraint.Relation?,
        _ rhs: CGFloat,
        constant: CGFloat? = nil,
        multiplier: CGFloat? = nil,
        priority: UILayoutPriority? = nil
    ) {
        guard let lhs = lhs, let relation = relation else {
            return nil
        }
        self.lhs = ConstraintExpression(lhs, lhsAttribute)
        self.relation = relation
        self.rhs = .dimension(rhs)
        self.constant = constant
        self.multiplier = multiplier
        self.priority = priority
    }

    internal init(
        lhs: ConstraintExpression,
        relation: NSLayoutConstraint.Relation,
        rhs: Constraint.Operand,
        constant: CGFloat?,
        multiplier: CGFloat?,
        priority: UILayoutPriority?
    ) {
        self.lhs = lhs
        self.relation = relation
        self.rhs = rhs
        self.constant = constant
        self.multiplier = multiplier
        self.priority = priority
    }
    
    internal var description: String {
        let components = [
            lhs.item.description + lhs.constraintAttribute.alp_description,
            relation.alp_description,
            rhs.description
        ]
        return components
            .filter { $0.isEmpty == false }
            .joined(separator: " ")
    }
    
    internal func canUpdate(to otherConstraint: Constraint) -> Bool {
        return lhs == otherConstraint.lhs
            && rhs.canUpdate(to: otherConstraint.rhs)
            && relation == otherConstraint.relation
            && multiplier == otherConstraint.multiplier
            && {
                switch (priority ?? .required, otherConstraint.priority ?? .required) {
                case (.required, .required): return true
                case (.required, _): return false
                case (_, .required): return false
                default: return true
                }
            }()
    }

}

extension Layout {
    public static func constrain(
        _ lhs: AnyObject,
        _ lhsAttribute: NSLayoutConstraint.Attribute,
        _ relation: NSLayoutConstraint.Relation,
        _ rhs: AnyObject,
        _ rhsAttribute: NSLayoutConstraint.Attribute,
        constant: CGFloat? = nil,
        multiplier: CGFloat? = nil,
        priority: UILayoutPriority? = nil
    ) {
        Layout.push(
            Constraint(
                lhs, lhsAttribute,
                relation,
                rhs, rhsAttribute,
                constant: constant,
                multiplier: multiplier,
                priority: priority
            )
        )
    }

    public static func constrain(
        _ lhs: AnyObject,
        _ lhsAttribute: NSLayoutConstraint.Attribute,
        _ relation: NSLayoutConstraint.Relation,
        _ rhs: CGFloat,
        constant: CGFloat? = nil,
        multiplier: CGFloat? = nil,
        priority: UILayoutPriority? = nil
    ) {
        Layout.push(
            Constraint(
                lhs, lhsAttribute,
                relation,
                rhs,
                constant: constant,
                multiplier: multiplier,
                priority: priority
            )
        )
    }
}
