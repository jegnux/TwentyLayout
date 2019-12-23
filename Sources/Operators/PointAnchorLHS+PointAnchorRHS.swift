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
    Layout.push(Constraint(lhs.yAnchor, .equal, rhs.constraintValue.yAnchor ~ rhs))
    Layout.push(Constraint(lhs.xAnchor, .equal, rhs.constraintValue.xAnchor ~ rhs))
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
    Layout.push(Constraint(lhs.yAnchor, .lessThanOrEqual, rhs.constraintValue.yAnchor ~ rhs))
    Layout.push(Constraint(lhs.xAnchor, .lessThanOrEqual, rhs.constraintValue.xAnchor ~ rhs))
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
    Layout.push(Constraint(lhs.yAnchor, .greaterThanOrEqual, rhs.constraintValue.yAnchor ~ rhs))
    Layout.push(Constraint(lhs.xAnchor, .greaterThanOrEqual, rhs.constraintValue.xAnchor ~ rhs))
}
