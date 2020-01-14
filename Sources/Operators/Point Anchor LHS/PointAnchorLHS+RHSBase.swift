//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

/// label.anchors.bottom.left == image.anchors.top.right
public func == <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value : Constrainable
{
    Layout.push(Constraint(lhs.y, .equal, rhs))
    Layout.push(Constraint(lhs.x, .equal, rhs))
}

/// label.anchors.bottom.left <= image.anchors.top.right
public func <= <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value : Constrainable
{
    Layout.push(Constraint(lhs.y, .lessThanOrEqual, rhs))
    Layout.push(Constraint(lhs.x, .lessThanOrEqual, rhs))
}

/// label.anchors.bottom.left >= image.anchors.top.right
public func >= <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value : Constrainable
{
    Layout.push(Constraint(lhs.y, .greaterThanOrEqual, rhs))
    Layout.push(Constraint(lhs.x, .greaterThanOrEqual, rhs))
}
