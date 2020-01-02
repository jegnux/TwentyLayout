//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

/// label.anchors.size == \.superview
public func == <
    LHSBase,
    RHSBase: Constrainable
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: KeyPath<LHSBase, RHSBase?>
) {
    Layout.push(Constraint(lhs.width, .equal, rhs))
    Layout.push(Constraint(lhs.height, .equal, rhs))
}

/// label.anchors.size == \.superview
public func == <
    LHSBase,
    RHS: ConstraintOperand, RHSBase: Constrainable
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, RHSBase?>
{
    Layout.push(Constraint(lhs.width, .equal, rhs))
    Layout.push(Constraint(lhs.height, .equal, rhs))
}


/// label.anchors.size <= \.superview
public func <= <
    LHSBase,
    RHSBase: Constrainable
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: KeyPath<LHSBase, RHSBase?>
) {
    Layout.push(Constraint(lhs.width, .lessThanOrEqual, rhs))
    Layout.push(Constraint(lhs.height, .lessThanOrEqual, rhs))
}

/// label.anchors.size <= \.superview
public func <= <
    LHSBase,
    RHS: ConstraintOperand, RHSBase: Constrainable
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, RHSBase?>
{
    Layout.push(Constraint(lhs.width, .lessThanOrEqual, rhs))
    Layout.push(Constraint(lhs.height, .lessThanOrEqual, rhs))
}


/// label.anchors.size >= \.superview
public func >= <
    LHSBase,
    RHSBase: Constrainable
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: KeyPath<LHSBase, RHSBase?>
) {
    Layout.push(Constraint(lhs.width, .greaterThanOrEqual, rhs))
    Layout.push(Constraint(lhs.height, .greaterThanOrEqual, rhs))
}

/// label.anchors.size >= \.superview
public func >= <
    LHSBase,
    RHS: ConstraintOperand, RHSBase: Constrainable
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, RHSBase?>
{
    Layout.push(Constraint(lhs.width, .greaterThanOrEqual, rhs))
    Layout.push(Constraint(lhs.height, .greaterThanOrEqual, rhs))
}
