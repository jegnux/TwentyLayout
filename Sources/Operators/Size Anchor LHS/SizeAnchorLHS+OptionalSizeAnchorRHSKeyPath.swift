//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

/// label.anchors.bottom.left == \.image.anchors.top.right
public func == <
    LHSBase,
    RHSBase
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: KeyPath<LHSBase, SizeAnchor<RHSBase>?>
) {
    Layout.push(Constraint(lhs.width, .equal, lhs.item[keyPath: rhs.constraintValue]?.width ~ rhs))
    Layout.push(Constraint(lhs.height, .equal, lhs.item[keyPath: rhs.constraintValue]?.height ~ rhs))
}

/// label.anchors.bottom.left == \.image.anchors.top.right
public func == <
    LHSBase,
    RHS: ConstraintOperand, RHSBase
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, SizeAnchor<RHSBase>?>
{
    Layout.push(Constraint(lhs.width, .equal, lhs.item[keyPath: rhs.constraintValue]?.width ~ rhs))
    Layout.push(Constraint(lhs.height, .equal, lhs.item[keyPath: rhs.constraintValue]?.height ~ rhs))
}


/// label.anchors.bottom.left <= \.image.anchors.top.right
public func <= <
    LHSBase,
    RHSBase
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: KeyPath<LHSBase, SizeAnchor<RHSBase>?>
) {
    Layout.push(Constraint(lhs.width, .lessThanOrEqual, lhs.item[keyPath: rhs.constraintValue]?.width ~ rhs))
    Layout.push(Constraint(lhs.height, .lessThanOrEqual, lhs.item[keyPath: rhs.constraintValue]?.height ~ rhs))
}


/// label.anchors.bottom.left <= \.image.anchors.top.right
public func <= <
    LHSBase,
    RHS: ConstraintOperand, RHSBase
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, SizeAnchor<RHSBase>?>
{
    Layout.push(Constraint(lhs.width, .lessThanOrEqual, lhs.item[keyPath: rhs.constraintValue]?.width ~ rhs))
    Layout.push(Constraint(lhs.height, .lessThanOrEqual, lhs.item[keyPath: rhs.constraintValue]?.height ~ rhs))
}

/// label.anchors.bottom.left >= \.image.anchors.top.right
public func >= <
    LHSBase,
    RHSBase
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: KeyPath<LHSBase, SizeAnchor<RHSBase>?>
) {
    Layout.push(Constraint(lhs.width, .greaterThanOrEqual, lhs.item[keyPath: rhs.constraintValue]?.width ~ rhs))
    Layout.push(Constraint(lhs.height, .greaterThanOrEqual, lhs.item[keyPath: rhs.constraintValue]?.height ~ rhs))
}

/// label.anchors.bottom.left >= \.image.anchors.top.right
public func >= <
    LHSBase,
    RHS: ConstraintOperand, RHSBase
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, SizeAnchor<RHSBase>?>
{
    Layout.push(Constraint(lhs.width, .greaterThanOrEqual, lhs.item[keyPath: rhs.constraintValue]?.width ~ rhs))
    Layout.push(Constraint(lhs.height, .greaterThanOrEqual, lhs.item[keyPath: rhs.constraintValue]?.height ~ rhs))
}
