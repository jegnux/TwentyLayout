//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation

// MARK: - SingleAnchor <> KeyPath

/// label.anchors.width == \.superview
public func == <LHSBase, RHSBase: Constrainable, LHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<LHSBase, RHSBase?>
) where
LHSAttribute.Kind: PositionAttributeKind
{
    Layout.push(lhs, .equal, rhs)
}

/// label.anchors.width <= \.superview
public func <= <LHSBase, RHSBase: Constrainable, LHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<LHSBase, RHSBase?>
) where
LHSAttribute.Kind: PositionAttributeKind
{
    Layout.push(lhs, .lessThanOrEqual, rhs)
}

/// label.anchors.width >= \.superview
public func >= <LHSBase, RHSBase: Constrainable, LHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<LHSBase, RHSBase?>
) where
LHSAttribute.Kind: PositionAttributeKind
{
    Layout.push(lhs, .greaterThanOrEqual, rhs)
}
