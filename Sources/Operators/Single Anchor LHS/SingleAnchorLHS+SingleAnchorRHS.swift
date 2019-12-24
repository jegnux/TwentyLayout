//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation

// MARK: - label.anchors.leading <> button.anchors.trailing // Same Axis + PositionAnchorKind

public func == <LHSBase, LHSAttribute, RHS: ConstraintOperand, RHSBase, RHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value == SingleAnchor<RHSBase, RHSAttribute>,
    LHSAttribute.Axis == RHSAttribute.Axis,
    LHSAttribute.Kind.ValueKind == PositionValueKind,
    RHSAttribute.Kind.ValueKind == PositionValueKind
{
    Layout.push(Constraint(lhs, .equal, rhs))
}

public func <= <LHSBase, LHSAttribute, RHS: ConstraintOperand, RHSBase, RHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value == SingleAnchor<RHSBase, RHSAttribute>,
    LHSAttribute.Axis == RHSAttribute.Axis,
    LHSAttribute.Kind.ValueKind == PositionValueKind,
    RHSAttribute.Kind.ValueKind == PositionValueKind
{
    Layout.push(Constraint(lhs, .lessThanOrEqual, rhs))
}

public func >= <LHSBase, LHSAttribute, RHS: ConstraintOperand, RHSBase, RHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value == SingleAnchor<RHSBase, RHSAttribute>,
    LHSAttribute.Axis == RHSAttribute.Axis,
    LHSAttribute.Kind.ValueKind == PositionValueKind,
    RHSAttribute.Kind.ValueKind == PositionValueKind
{
    Layout.push(Constraint(lhs, .greaterThanOrEqual, rhs))
}

public func == <LHSBase, LHSAttribute, RHS: ConstraintOperand, RHSBase, RHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value == SingleAnchor<RHSBase, RHSAttribute>,
    LHSAttribute.Kind.ValueKind == DimensionValueKind,
    RHSAttribute.Kind.ValueKind == DimensionValueKind
{
    Layout.push(Constraint(lhs, .equal, rhs))
}

public func <= <LHSBase, LHSAttribute, RHS: ConstraintOperand, RHSBase, RHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value == SingleAnchor<RHSBase, RHSAttribute>,
    LHSAttribute.Kind.ValueKind == DimensionValueKind,
    RHSAttribute.Kind.ValueKind == DimensionValueKind
{
    Layout.push(Constraint(lhs, .lessThanOrEqual, rhs))
}

public func >= <LHSBase, LHSAttribute, RHS: ConstraintOperand, RHSBase, RHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value == SingleAnchor<RHSBase, RHSAttribute>,
    LHSAttribute.Kind.ValueKind == DimensionValueKind,
    RHSAttribute.Kind.ValueKind == DimensionValueKind
{
    Layout.push(Constraint(lhs, .greaterThanOrEqual, rhs))
}
