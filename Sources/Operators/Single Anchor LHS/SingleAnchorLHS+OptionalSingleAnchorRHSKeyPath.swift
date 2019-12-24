//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation

// MARK: - SingleAnchor <> KeyPath

/// label.anchors.leading == \.superview?.anchors.leading
public func == <
    LHSBase, LHSAttribute,
    RHSBase, RHSAttribute: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>?>
) where
    LHSAttribute.Axis == RHSAttribute.Axis,
    LHSAttribute.Kind.ValueKind == PositionValueKind,
    RHSAttribute.Kind.ValueKind == PositionValueKind
{
    Layout.push(Constraint(lhs, .equal, rhs))
}

/// label.anchors.leading == \.superview?.anchors.leading ~ xxx
public func == <
    LHSBase, LHSAttribute,
    RHS: ConstraintOperand, RHSBase, RHSAttribute: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>?>,
    LHSAttribute.Axis == RHSAttribute.Axis,
    LHSAttribute.Kind.ValueKind == PositionValueKind,
    RHSAttribute.Kind.ValueKind == PositionValueKind
{
    Layout.push(Constraint(lhs, .equal, rhs))
}
/// label.anchors.leading <= \.superview?.anchors.leading
public func <= <
    LHSBase, LHSAttribute,
    RHSBase, RHSAttribute: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>?>
) where
    LHSAttribute.Axis == RHSAttribute.Axis,
    LHSAttribute.Kind.ValueKind == PositionValueKind,
    RHSAttribute.Kind.ValueKind == PositionValueKind
{
    Layout.push(Constraint(lhs, .lessThanOrEqual, rhs))
}

/// label.anchors.leading <= \.superview?.anchors.leading ~ xxx
public func <= <
    LHSBase, LHSAttribute,
    RHS: ConstraintOperand, RHSBase, RHSAttribute: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>?>,
    LHSAttribute.Axis == RHSAttribute.Axis,
    LHSAttribute.Kind.ValueKind == PositionValueKind,
    RHSAttribute.Kind.ValueKind == PositionValueKind
{
    Layout.push(Constraint(lhs, .lessThanOrEqual, rhs))
}

/// label.anchors.leading >= \.superview?.anchors.leading
public func >= <
    LHSBase, LHSAttribute,
    RHSBase, RHSAttribute: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>?>
) where
    LHSAttribute.Axis == RHSAttribute.Axis,
    LHSAttribute.Kind.ValueKind == PositionValueKind,
    RHSAttribute.Kind.ValueKind == PositionValueKind
{
    Layout.push(Constraint(lhs, .greaterThanOrEqual, rhs))
}

/// label.anchors.leading >= \.superview?.anchors.leading ~ xxx
public func >= <
    LHSBase, LHSAttribute,
    RHS: ConstraintOperand, RHSBase, RHSAttribute: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>?>,
    LHSAttribute.Axis == RHSAttribute.Axis,
    LHSAttribute.Kind.ValueKind == PositionValueKind,
    RHSAttribute.Kind.ValueKind == PositionValueKind
{
    Layout.push(Constraint(lhs, .greaterThanOrEqual, rhs))
}

/// label.anchors.width == \.superview?.anchors.height
public func == <
    LHSBase, LHSAttribute,
    RHSBase, RHSAttribute: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>?>
) where
    LHSAttribute.Kind.ValueKind == DimensionValueKind,
    RHSAttribute.Kind.ValueKind == DimensionValueKind
{
    Layout.push(Constraint(lhs, .equal, rhs))
}

/// label.anchors.width == \.superview?.anchors.height ~ xxx
public func == <
    LHSBase, LHSAttribute,
    RHS: ConstraintOperand, RHSBase, RHSAttribute: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>?>,
    LHSAttribute.Kind.ValueKind == DimensionValueKind,
    RHSAttribute.Kind.ValueKind == DimensionValueKind
{
    Layout.push(Constraint(lhs, .equal, rhs))
}
/// label.anchors.width <= \.superview?.anchors.height
public func <= <
    LHSBase, LHSAttribute,
    RHSBase, RHSAttribute: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>?>
) where
    LHSAttribute.Kind.ValueKind == DimensionValueKind,
    RHSAttribute.Kind.ValueKind == DimensionValueKind
{
    Layout.push(Constraint(lhs, .lessThanOrEqual, rhs))
}

/// label.anchors.width <= \.superview?.anchors.height ~ xxx
public func <= <
    LHSBase, LHSAttribute,
    RHS: ConstraintOperand, RHSBase, RHSAttribute: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>?>,
    LHSAttribute.Kind.ValueKind == DimensionValueKind,
    RHSAttribute.Kind.ValueKind == DimensionValueKind
{
    Layout.push(Constraint(lhs, .lessThanOrEqual, rhs))
}

/// label.anchors.width >= \.superview?.anchors.height
public func >= <
    LHSBase, LHSAttribute,
    RHSBase, RHSAttribute: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>?>
) where
    LHSAttribute.Kind.ValueKind == DimensionValueKind,
    RHSAttribute.Kind.ValueKind == DimensionValueKind
{
    Layout.push(Constraint(lhs, .greaterThanOrEqual, rhs))
}

/// label.anchors.width >= \.superview?.anchors.height ~ xxx
public func >= <
    LHSBase, LHSAttribute,
    RHS: ConstraintOperand, RHSBase, RHSAttribute: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>?>,
    LHSAttribute.Kind.ValueKind == DimensionValueKind,
    RHSAttribute.Kind.ValueKind == DimensionValueKind
{
    Layout.push(Constraint(lhs, .greaterThanOrEqual, rhs))
}
