//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation


/// label.anchors.leading == button
/// - Parameters:
///   - lhs: A single anchor
///   - rhs: <#rhs description#>
public func == <LHSBase, RHSBase: Constrainable, LHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHSBase
) where
    LHSAttribute.Kind: PositionAttributeKind
{
    Layout.push(lhs, .equal, rhs)
}

/// label.anchors.leading <= button
public func <= <LHSBase, RHSBase: Constrainable, LHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHSBase
) where
    LHSAttribute.Kind: PositionAttributeKind
{
    Layout.push(lhs, .lessThanOrEqual, rhs)
}

/// label.anchors.leading >= button
public func >= <LHSBase, RHSBase: Constrainable, LHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHSBase
) where
    LHSAttribute.Kind: PositionAttributeKind
{
    Layout.push(lhs, .greaterThanOrEqual, rhs)
}

/// label.anchors.width == button
public func == <LHSBase, RHSBase: Constrainable, LHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHSBase
) where
    LHSAttribute.Kind: DimensionAttributeKind
{
    Layout.push(lhs, .equal, rhs)
}

/// label.anchors.width <= button
public func <= <LHSBase, RHSBase: Constrainable, LHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHSBase
) where
    LHSAttribute.Kind: DimensionAttributeKind
{
    Layout.push(lhs, .lessThanOrEqual, rhs)
}

/// label.anchors.width >= button
public func >= <LHSBase, RHSBase: Constrainable, LHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHSBase
) where
    LHSAttribute.Kind: DimensionAttributeKind
{
    Layout.push(lhs, .greaterThanOrEqual, rhs)
}
