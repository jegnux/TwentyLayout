//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation

// MARK: - SingleAnchor <> ModifiableConstraintItem

/// label.anchors.width == button.offset(by: 8)
public func == <LHSBase, RHSBase, LHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: ModifiableConstraintItem<RHSBase>
) where
    LHSAttribute.Kind: PositionAttributeKind
{
    Layout.push(lhs, .equal, rhs)
}

/// label.anchors.width <= button.offset(by: 8)
public func <= <LHSBase, RHSBase, LHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: ModifiableConstraintItem<RHSBase>
) where
    LHSAttribute.Kind: PositionAttributeKind
{
    Layout.push(lhs, .lessThanOrEqual, rhs)
}

/// label.anchors.width >= button.offset(by: 8)
public func >= <LHSBase, RHSBase, LHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: ModifiableConstraintItem<RHSBase>
) where
    LHSAttribute.Kind: PositionAttributeKind
{
    Layout.push(lhs, .greaterThanOrEqual, rhs)
}
