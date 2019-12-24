//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation

// MARK: - SingleAnchor <> KeyPath

/// label.anchors.width == \.superview
public func == <
    LHSBase, LHSAttribute,
    RHSBase: Constrainable
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<LHSBase, RHSBase?>
) {
    Layout.push(Constraint(lhs, .equal, rhs))
}

/// label.anchors.width == \.superview ~ xxx
public func == <
    LHSBase, LHSAttribute,
    RHS: ConstraintOperand, RHSBase: Constrainable
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value : KeyPath<LHSBase, RHSBase?>
{
    Layout.push(Constraint(lhs, .equal, rhs))
}

/// label.anchors.width <= \.superview
public func <= <
    LHSBase, LHSAttribute,
    RHSBase: Constrainable
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<LHSBase, RHSBase?>
) {
    Layout.push(Constraint(lhs, .lessThanOrEqual, rhs))
}

/// label.anchors.width <= \.superview ~ xxx
public func <= <
    LHSBase, LHSAttribute,
    RHS: ConstraintOperand, RHSBase: Constrainable
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value : KeyPath<LHSBase, RHSBase?>
{
    Layout.push(Constraint(lhs, .lessThanOrEqual, rhs))
}

/// label.anchors.width >= \.superview
public func >= <
    LHSBase, LHSAttribute,
    RHSBase: Constrainable
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<LHSBase, RHSBase?>
) {
    Layout.push(Constraint(lhs, .greaterThanOrEqual, rhs))
}

/// label.anchors.width >= \.superview ~ xxx
public func >= <
    LHSBase, LHSAttribute,
    RHS: ConstraintOperand, RHSBase: Constrainable
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value : KeyPath<LHSBase, RHSBase?>
{
    Layout.push(Constraint(lhs, .greaterThanOrEqual, rhs))
}
