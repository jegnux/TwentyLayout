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
    rhs: KeyPath<LHSBase, PointAnchor<RHSBase, RHSXAttribute, RHSYAttribute>?>
) {
    Layout.push(Constraint(lhs.y, .equal, lhs.item[keyPath: rhs.constraintValue]?.y ~ rhs))
    Layout.push(Constraint(lhs.x, .equal, lhs.item[keyPath: rhs.constraintValue]?.x ~ rhs))
}

/// label.anchors.bottom.left == \.image.anchors.top.right
public func == <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand, RHSBase, RHSXAttribute, RHSYAttribute
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, PointAnchor<RHSBase, RHSXAttribute, RHSYAttribute>?>
{
    Layout.push(Constraint(lhs.y, .equal, lhs.item[keyPath: rhs.constraintValue]?.y ~ rhs))
    Layout.push(Constraint(lhs.x, .equal, lhs.item[keyPath: rhs.constraintValue]?.x ~ rhs))
}


/// label.anchors.bottom.left <= \.image.anchors.top.right
public func <= <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHSBase, RHSXAttribute, RHSYAttribute
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: KeyPath<LHSBase, PointAnchor<RHSBase, RHSXAttribute, RHSYAttribute>?>
) {
    Layout.push(Constraint(lhs.y, .lessThanOrEqual, lhs.item[keyPath: rhs.constraintValue]?.y ~ rhs))
    Layout.push(Constraint(lhs.x, .lessThanOrEqual, lhs.item[keyPath: rhs.constraintValue]?.x ~ rhs))
}


/// label.anchors.bottom.left <= \.image.anchors.top.right
public func <= <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand, RHSBase, RHSXAttribute, RHSYAttribute
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, PointAnchor<RHSBase, RHSXAttribute, RHSYAttribute>?>
{
    Layout.push(Constraint(lhs.y, .lessThanOrEqual, lhs.item[keyPath: rhs.constraintValue]?.y ~ rhs))
    Layout.push(Constraint(lhs.x, .lessThanOrEqual, lhs.item[keyPath: rhs.constraintValue]?.x ~ rhs))
}

/// label.anchors.bottom.left >= \.image.anchors.top.right
public func >= <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHSBase, RHSXAttribute, RHSYAttribute
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: KeyPath<LHSBase, PointAnchor<RHSBase, RHSXAttribute, RHSYAttribute>?>
) {
    Layout.push(Constraint(lhs.y, .greaterThanOrEqual, lhs.item[keyPath: rhs.constraintValue]?.y ~ rhs))
    Layout.push(Constraint(lhs.x, .greaterThanOrEqual, lhs.item[keyPath: rhs.constraintValue]?.x ~ rhs))
}

/// label.anchors.bottom.left >= \.image.anchors.top.right
public func >= <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand, RHSBase, RHSXAttribute, RHSYAttribute
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, PointAnchor<RHSBase, RHSXAttribute, RHSYAttribute>?>
{
    Layout.push(Constraint(lhs.y, .greaterThanOrEqual, lhs.item[keyPath: rhs.constraintValue]?.y ~ rhs))
    Layout.push(Constraint(lhs.x, .greaterThanOrEqual, lhs.item[keyPath: rhs.constraintValue]?.x ~ rhs))
}
