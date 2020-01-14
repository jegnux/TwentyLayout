//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

/// label.anchors.bottom.left == \.child
public func == <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHSBase: Constrainable
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: KeyPath<LHSBase, RHSBase>
) {
    Layout.push(Constraint(lhs.y, .equal, rhs))
    Layout.push(Constraint(lhs.x, .equal, rhs))
}

/// label.anchors.bottom.left == \.child
public func == <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand, RHSBase: Constrainable
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, RHSBase>
{
    Layout.push(Constraint(lhs.y, .equal, rhs))
    Layout.push(Constraint(lhs.x, .equal, rhs))
}

/// label.anchors.bottom.left <= \.child
public func <= <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHSBase: Constrainable
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: KeyPath<LHSBase, RHSBase>
) {
    Layout.push(Constraint(lhs.y, .lessThanOrEqual, rhs))
    Layout.push(Constraint(lhs.x, .lessThanOrEqual, rhs))
}

/// label.anchors.bottom.left <= \.child
public func <= <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand, RHSBase: Constrainable
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, RHSBase>
{
    Layout.push(Constraint(lhs.y, .lessThanOrEqual, rhs))
    Layout.push(Constraint(lhs.x, .lessThanOrEqual, rhs))
}

/// label.anchors.bottom.left >= \.child
public func >= <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHSBase: Constrainable
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: KeyPath<LHSBase, RHSBase>
) {
    Layout.push(Constraint(lhs.y, .greaterThanOrEqual, rhs))
    Layout.push(Constraint(lhs.x, .greaterThanOrEqual, rhs))
}

/// label.anchors.bottom.left >= \.child
public func >= <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHS: ConstraintOperand, RHSBase: Constrainable
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, RHSBase>
{
    Layout.push(Constraint(lhs.y, .greaterThanOrEqual, rhs))
    Layout.push(Constraint(lhs.x, .greaterThanOrEqual, rhs))
}
