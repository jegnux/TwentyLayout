//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

/// label.anchors.bottom.left == \.image.anchors.top.right
public func == <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHSBase, RHSXAttribute, RHSYAttribute
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: KeyPath<LHSBase, PointAnchor<RHSBase, RHSXAttribute, RHSYAttribute>>
) {
    Layout.push(Constraint(lhs.yAnchor, .equal, lhs.item[keyPath: rhs.constraintValue].yAnchor ~ rhs))
    Layout.push(Constraint(lhs.xAnchor, .equal, lhs.item[keyPath: rhs.constraintValue].xAnchor ~ rhs))
}

/// label.anchors.bottom.left == \.image.anchors.top.right
public func == <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand, RHSBase, RHSXAttribute, RHSYAttribute
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, PointAnchor<RHSBase, RHSXAttribute, RHSYAttribute>>
{
    Layout.push(Constraint(lhs.yAnchor, .equal, lhs.item[keyPath: rhs.constraintValue].yAnchor ~ rhs))
    Layout.push(Constraint(lhs.xAnchor, .equal, lhs.item[keyPath: rhs.constraintValue].xAnchor ~ rhs))
}


/// label.anchors.bottom.left <= \.image.anchors.top.right
public func <= <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHSBase, RHSXAttribute, RHSYAttribute
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: KeyPath<LHSBase, PointAnchor<RHSBase, RHSXAttribute, RHSYAttribute>>
) {
    Layout.push(Constraint(lhs.yAnchor, .lessThanOrEqual, lhs.item[keyPath: rhs.constraintValue].yAnchor ~ rhs))
    Layout.push(Constraint(lhs.xAnchor, .lessThanOrEqual, lhs.item[keyPath: rhs.constraintValue].xAnchor ~ rhs))
}


/// label.anchors.bottom.left <= \.image.anchors.top.right
public func <= <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand, RHSBase, RHSXAttribute, RHSYAttribute
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, PointAnchor<RHSBase, RHSXAttribute, RHSYAttribute>>
{
    Layout.push(Constraint(lhs.yAnchor, .lessThanOrEqual, lhs.item[keyPath: rhs.constraintValue].yAnchor ~ rhs))
    Layout.push(Constraint(lhs.xAnchor, .lessThanOrEqual, lhs.item[keyPath: rhs.constraintValue].xAnchor ~ rhs))
}

/// label.anchors.bottom.left >= \.image.anchors.top.right
public func >= <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHSBase, RHSXAttribute, RHSYAttribute
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: KeyPath<LHSBase, PointAnchor<RHSBase, RHSXAttribute, RHSYAttribute>>
) {
    Layout.push(Constraint(lhs.yAnchor, .greaterThanOrEqual, lhs.item[keyPath: rhs.constraintValue].yAnchor ~ rhs))
    Layout.push(Constraint(lhs.xAnchor, .greaterThanOrEqual, lhs.item[keyPath: rhs.constraintValue].xAnchor ~ rhs))
}

/// label.anchors.bottom.left >= \.image.anchors.top.right
public func >= <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand, RHSBase, RHSXAttribute, RHSYAttribute
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, PointAnchor<RHSBase, RHSXAttribute, RHSYAttribute>>
{
    Layout.push(Constraint(lhs.yAnchor, .greaterThanOrEqual, lhs.item[keyPath: rhs.constraintValue].yAnchor ~ rhs))
    Layout.push(Constraint(lhs.xAnchor, .greaterThanOrEqual, lhs.item[keyPath: rhs.constraintValue].xAnchor ~ rhs))
}
