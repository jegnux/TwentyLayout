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
    Layout.push(Constraint(lhs.yAnchor, .equal, rhs))
    Layout.push(Constraint(lhs.xAnchor, .equal, rhs))
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
    Layout.push(Constraint(lhs.yAnchor, .equal, rhs))
    Layout.push(Constraint(lhs.xAnchor, .equal, rhs))
}


/// label.anchors.bottom.left <= \.child
public func <= <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHSBase: Constrainable
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: KeyPath<LHSBase, RHSBase>
) {
    Layout.push(Constraint(lhs.yAnchor, .lessThanOrEqual, rhs))
    Layout.push(Constraint(lhs.xAnchor, .lessThanOrEqual, rhs))
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
    Layout.push(Constraint(lhs.yAnchor, .lessThanOrEqual, rhs))
    Layout.push(Constraint(lhs.xAnchor, .lessThanOrEqual, rhs))
}


/// label.anchors.bottom.left >= \.child
public func >= <
    LHSBase, LHSXAttribute, LHSYAttribute,
    RHSBase: Constrainable
    >(
    lhs: PointAnchor<LHSBase, LHSXAttribute, LHSYAttribute>,
    rhs: KeyPath<LHSBase, RHSBase>
) {
    Layout.push(Constraint(lhs.yAnchor, .greaterThanOrEqual, rhs))
    Layout.push(Constraint(lhs.xAnchor, .greaterThanOrEqual, rhs))
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
    Layout.push(Constraint(lhs.yAnchor, .greaterThanOrEqual, rhs))
    Layout.push(Constraint(lhs.xAnchor, .greaterThanOrEqual, rhs))
}
