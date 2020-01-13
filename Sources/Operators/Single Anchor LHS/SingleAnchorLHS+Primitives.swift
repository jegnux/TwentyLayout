//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

/// label.anchors.leading == 20
public func == <
    LHSBase: UIView, LHSAttribute,
    RHS: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value: SingleAnchorPrimitive,
    LHSAttribute.Kind.ValueKind == PositionValueKind
{
    Layout.push(Constraint(lhs, .equal, lhs.on(lhs.item.superview) ~ rhs))
}

/// label.anchors.leading <= 20
public func <= <
    LHSBase: UIView, LHSAttribute,
    RHS: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value: SingleAnchorPrimitive,
    LHSAttribute.Kind.ValueKind == PositionValueKind
{
    Layout.push(Constraint(lhs, .lessThanOrEqual, lhs.on(lhs.item.superview) ~ rhs))
}

/// label.anchors.leading >= 20
public func >= <
    LHSBase: UIView, LHSAttribute,
    RHS: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value: SingleAnchorPrimitive,
    LHSAttribute.Kind.ValueKind == PositionValueKind
{
    Layout.push(Constraint(lhs, .greaterThanOrEqual, lhs.on(lhs.item.superview) ~ rhs))
}

/// label.anchors.width == 200
public func == <
    LHSBase: UIView, LHSAttribute,
    RHS: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value: SingleAnchorPrimitive,
    LHSAttribute.Kind.ValueKind == DimensionValueKind
{
    Layout.push(Constraint(
        lhs: ConstraintExpression(lhs),
        relation: .equal,
        rhs: .dimension(rhs.constant(for: lhs.constraintAttribute) ?? 0),
        constant: nil,
        multiplier: nil,
        priority: rhs.priority
    ))
}

/// label.anchors.width <= 200
public func <= <
    LHSBase: UIView, LHSAttribute,
    RHS: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value: SingleAnchorPrimitive,
    LHSAttribute.Kind.ValueKind == DimensionValueKind
{
    Layout.push(Constraint(
        lhs: ConstraintExpression(lhs),
        relation: .lessThanOrEqual,
        rhs: .dimension(rhs.constant(for: lhs.constraintAttribute) ?? 0),
        constant: nil,
        multiplier: nil,
        priority: rhs.priority
    ))
}

/// label.anchors.width >= 200
public func >= <
    LHSBase: UIView, LHSAttribute,
    RHS: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value: SingleAnchorPrimitive,
    LHSAttribute.Kind.ValueKind == DimensionValueKind
{
    Layout.push(Constraint(
        lhs: ConstraintExpression(lhs),
        relation: .greaterThanOrEqual,
        rhs: .dimension(rhs.constant(for: lhs.constraintAttribute) ?? 0),
        constant: nil,
        multiplier: nil,
        priority: rhs.priority
    ))
}
