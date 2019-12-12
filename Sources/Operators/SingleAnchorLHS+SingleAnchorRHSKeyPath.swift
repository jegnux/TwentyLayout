//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation

// MARK: - SingleAnchor <> KeyPath

/// label.anchors.leading == \.superview?.anchors.leading
public func == <LHSBase, LHSAttribute: Attribute, RHSBase: Constrainable, RHSAttribute: Attribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>>
) where
    LHSAttribute.Kind: PositionAttributeKind,
    RHSAttribute.Kind: PositionAttributeKind,
    LHSAttribute.Axis == RHSAttribute.Axis
{
    Layout.push(lhs, .equal, lhs.item[keyPath: rhs])
}

/// label.anchors.leading <= \.superview?.anchors.leading
public func <= <LHSBase, LHSAttribute: Attribute, RHSBase: Constrainable, RHSAttribute: Attribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>>
) where
    LHSAttribute.Kind: PositionAttributeKind,
    RHSAttribute.Kind: PositionAttributeKind,
    LHSAttribute.Axis == RHSAttribute.Axis
{
    Layout.push(lhs, .lessThanOrEqual, lhs.item[keyPath: rhs])
}

/// label.anchors.leading >= \.superview?.anchors.leading
public func >= <LHSBase, LHSAttribute: Attribute, RHSBase: Constrainable, RHSAttribute: Attribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>>
) where
    LHSAttribute.Kind: PositionAttributeKind,
    RHSAttribute.Kind: PositionAttributeKind,
    LHSAttribute.Axis == RHSAttribute.Axis
{
    Layout.push(lhs, .greaterThanOrEqual, lhs.item[keyPath: rhs])
}


/// label.anchors.width == \.superview?.anchors.width
public func == <LHSBase, LHSAttribute: Attribute, RHSBase: Constrainable, RHSAttribute: Attribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>>
) where
    LHSAttribute.Kind: DimensionAttributeKind,
    RHSAttribute.Kind: DimensionAttributeKind
{
    Layout.push(lhs, .equal, lhs.item[keyPath: rhs])
}

/// label.anchors.width <= \.superview?.anchors.width
public func <= <LHSBase, LHSAttribute: Attribute, RHSBase: Constrainable, RHSAttribute: Attribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>>
) where
    LHSAttribute.Kind: DimensionAttributeKind,
    RHSAttribute.Kind: DimensionAttributeKind
{
    Layout.push(lhs, .lessThanOrEqual, lhs.item[keyPath: rhs])
}

/// label.anchors.width >= \.superview?.anchors.width
public func >= <LHSBase, LHSAttribute: Attribute, RHSBase: Constrainable, RHSAttribute: Attribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<LHSBase, SingleAnchor<RHSBase, RHSAttribute>>
) where
    LHSAttribute.Kind: DimensionAttributeKind,
    RHSAttribute.Kind: DimensionAttributeKind
{
    Layout.push(lhs, .greaterThanOrEqual, lhs.item[keyPath: rhs])
}
