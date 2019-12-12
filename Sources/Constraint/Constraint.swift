//
//  Created by Jérôme Alves on 06/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public struct Constraint: Hashable, CustomStringConvertible {
    internal enum Operand: Hashable, CustomStringConvertible {
        case expression(ConstraintExpression)
        case dimension(ConstraintDimension)
        
        internal var description: String {
            switch self {
            case .expression(let expression):
                return expression.item.description + expression.constraintAttribute.alp_description
            case .dimension(let dimension):
                return "\(dimension.rawValue)"
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
                return dimension.rawValue
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

    }
    internal let lhs: ConstraintExpression
    internal let relation: NSLayoutConstraint.Relation
    internal let rhs: Operand
    internal let constraintProperties: ConstraintProperties
    
    internal init<LHSBase: Constrainable, RHSBase: Constrainable>(
        _ lhs: LHSBase,
        _ lhsAttribute: NSLayoutConstraint.Attribute,
        _ relation: NSLayoutConstraint.Relation,
        _ rhs: RHSBase,
        _ rhsAttribute: NSLayoutConstraint.Attribute,
        _ constraintProperties: ConstraintProperties? = nil
    ) {
        self.lhs = ConstraintExpression(lhs, lhsAttribute)
        self.relation = relation
        self.rhs = .expression(ConstraintExpression(rhs, rhsAttribute))
        self.constraintProperties = constraintProperties ?? ConstraintProperties()
    }
    
    internal init<LHSBase, RHSBase, LHSAttribute, RHSAttribute>(
        _ lhs: SingleAnchor<LHSBase, LHSAttribute>,
        _ relation: NSLayoutConstraint.Relation,
        _ rhs: SingleAnchor<RHSBase, RHSAttribute>
    ) where
        LHSAttribute.Axis == RHSAttribute.Axis,
        LHSAttribute.Kind: PositionAttributeKind,
        RHSAttribute.Kind: PositionAttributeKind
    {
        self.lhs = ConstraintExpression(lhs)
        self.relation = relation
        self.rhs = .expression(ConstraintExpression(rhs))
        self.constraintProperties = rhs.constraintProperties
    }
    
    internal init<LHSBase, RHSBase, LHSAttribute, RHSAttribute>(
        _ lhs: SingleAnchor<LHSBase, LHSAttribute>,
        _ relation: NSLayoutConstraint.Relation,
        _ rhs: SingleAnchor<RHSBase, RHSAttribute>
    ) where
        LHSAttribute.Kind: DimensionAttributeKind,
        RHSAttribute.Kind: DimensionAttributeKind
    {
        self.lhs = ConstraintExpression(lhs)
        self.relation = relation
        self.rhs = .expression(ConstraintExpression(rhs))
        self.constraintProperties = rhs.constraintProperties
    }

    public var description: String {
        let components = [
            lhs.item.description + lhs.constraintAttribute.alp_description,
            relation.alp_description,
            rhs.description,
            constraintProperties.description
        ]
        return components
            .filter { $0.isEmpty == false }
            .joined(separator: " ")
    }
    
    internal func canUpdate(_ otherConstraint: Constraint) -> Bool {
        return lhs == otherConstraint.lhs
            && rhs == otherConstraint.rhs
            && relation == otherConstraint.relation
            && constraintProperties.multiplier == otherConstraint.constraintProperties.multiplier
    }

}
