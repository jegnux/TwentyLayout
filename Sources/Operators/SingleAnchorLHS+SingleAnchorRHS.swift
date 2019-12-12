//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation

// MARK: - label.anchors.leading <> button.anchors.trailing // Same Axis + PositionAnchorKind

public func == <LHSBase, RHSBase, LHSAttribute, RHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: SingleAnchor<RHSBase, RHSAttribute>
) where
    LHSAttribute.Axis == RHSAttribute.Axis,
    LHSAttribute.Kind: PositionAttributeKind,
    RHSAttribute.Kind: PositionAttributeKind
{
    Layout.push(lhs, .equal, rhs)
}

public func <= <LHSBase, RHSBase, LHSAttribute, RHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: SingleAnchor<RHSBase, RHSAttribute>
) where
    LHSAttribute.Axis == RHSAttribute.Axis,
    LHSAttribute.Kind: PositionAttributeKind,
    RHSAttribute.Kind: PositionAttributeKind
{
    Layout.push(lhs, .lessThanOrEqual, rhs)
}

public func >= <LHSBase, RHSBase, LHSAttribute, RHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: SingleAnchor<RHSBase, RHSAttribute>
) where
    LHSAttribute.Axis == RHSAttribute.Axis,
    LHSAttribute.Kind: PositionAttributeKind,
    RHSAttribute.Kind: PositionAttributeKind
{
    Layout.push(lhs, .greaterThanOrEqual, rhs)
}

// MARK: - label.anchors.width <> button.anchors.width // DimensionAnchorKind

public func == <LHSBase, RHSBase, LHSAttribute, RHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: SingleAnchor<RHSBase, RHSAttribute>
) where
    LHSAttribute.Kind: DimensionAttributeKind,
    RHSAttribute.Kind: DimensionAttributeKind
{
    Layout.push(lhs, .equal, rhs)
}

public func <= <LHSBase, RHSBase, LHSAttribute, RHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: SingleAnchor<RHSBase, RHSAttribute>
) where
    LHSAttribute.Kind: DimensionAttributeKind,
    RHSAttribute.Kind: DimensionAttributeKind
{
    Layout.push(lhs, .lessThanOrEqual, rhs)
}

public func >= <LHSBase, RHSBase, LHSAttribute, RHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: SingleAnchor<RHSBase, RHSAttribute>
) where
    LHSAttribute.Kind: DimensionAttributeKind,
    RHSAttribute.Kind: DimensionAttributeKind
{
    Layout.push(lhs, .greaterThanOrEqual, rhs)
}
