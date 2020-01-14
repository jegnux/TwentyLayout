//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

/// label.anchors.bottom.left == image.anchors.top.right
public func == <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand, RHSBase, RHSXAttribute, RHSYAttribute
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value == PointAnchor<RHSBase, RHSXAttribute, RHSYAttribute>
{
    Layout.push(Constraint(lhs.y, .equal, rhs.constraintValue.y ~ rhs))
    Layout.push(Constraint(lhs.x, .equal, rhs.constraintValue.x ~ rhs))
}

/// label.anchors.bottom.left <= image.anchors.top.right
public func <= <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand, RHSBase, RHSXAttribute, RHSYAttribute
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value == PointAnchor<RHSBase, RHSXAttribute, RHSYAttribute>
{
    Layout.push(Constraint(lhs.y, .lessThanOrEqual, rhs.constraintValue.y ~ rhs))
    Layout.push(Constraint(lhs.x, .lessThanOrEqual, rhs.constraintValue.x ~ rhs))
}

/// label.anchors.bottom.left >= image.anchors.top.right
public func >= <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand, RHSBase, RHSXAttribute, RHSYAttribute
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value == PointAnchor<RHSBase, RHSXAttribute, RHSYAttribute>
{
    Layout.push(Constraint(lhs.y, .greaterThanOrEqual, rhs.constraintValue.y ~ rhs))
    Layout.push(Constraint(lhs.x, .greaterThanOrEqual, rhs.constraintValue.x ~ rhs))
}
