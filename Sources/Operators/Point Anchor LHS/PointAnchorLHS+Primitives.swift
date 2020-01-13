//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

/// label.anchors.top.left == 20
public func == <
    LHSBase: UIView, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value: SingleAnchorPrimitive
{
    Layout.push(Constraint(lhs.y, .equal, lhs.y.on(lhs.item.superview) ~ rhs))
    Layout.push(Constraint(lhs.x, .equal, lhs.x.on(lhs.item.superview) ~ rhs))
}

/// label.anchors.top.left <= 20
public func <= <
    LHSBase: UIView, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value: SingleAnchorPrimitive
{
    Layout.push(Constraint(lhs.y, .lessThanOrEqual, lhs.y.on(lhs.item.superview) ~ rhs))
    Layout.push(Constraint(lhs.x, .lessThanOrEqual, lhs.x.on(lhs.item.superview) ~ rhs))
}

/// label.anchors.top.left >= 20
public func >= <
    LHSBase: UIView, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value: SingleAnchorPrimitive
{
    Layout.push(Constraint(lhs.y, .greaterThanOrEqual, lhs.y.on(lhs.item.superview) ~ rhs))
    Layout.push(Constraint(lhs.x, .greaterThanOrEqual, lhs.x.on(lhs.item.superview) ~ rhs))
}

/// label.anchors.top.left == CGPoint(x: 20, y: 40)
public func == <
    LHSBase: UIView, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value == CGPoint
{
    Layout.push(Constraint(lhs.y, .equal, lhs.y.on(lhs.item.superview) ~ rhs))
    Layout.push(Constraint(lhs.x, .equal, lhs.x.on(lhs.item.superview) ~ rhs))
}

/// label.anchors.top.left <= CGPoint(x: 20, y: 40)
public func <= <
    LHSBase: UIView, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value == CGPoint
{
    Layout.push(Constraint(lhs.y, .lessThanOrEqual, lhs.y.on(lhs.item.superview) ~ rhs))
    Layout.push(Constraint(lhs.x, .lessThanOrEqual, lhs.x.on(lhs.item.superview) ~ rhs))
}

/// label.anchors.top.left >= CGPoint(x: 20, y: 40)
public func >= <
    LHSBase: UIView, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value == CGPoint
{
    Layout.push(Constraint(lhs.y, .greaterThanOrEqual, lhs.y.on(lhs.item.superview) ~ rhs))
    Layout.push(Constraint(lhs.x, .greaterThanOrEqual, lhs.x.on(lhs.item.superview) ~ rhs))
}
