//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation

/// label.anchors.width == \.height
public func == <LHSBase>(
    lhs: SingleAnchor<LHSBase, Width>,
    rhs: KeyPath<Anchors<LHSBase>, SingleAnchor<LHSBase, Height>>
) {
    Layout.push(Constraint(lhs, .equal, rhs))
}

/// label.anchors.height == \.width
public func == <LHSBase>(
    lhs: SingleAnchor<LHSBase, Height>,
    rhs: KeyPath<Anchors<LHSBase>, SingleAnchor<LHSBase, Width>>
) {
    Layout.push(Constraint(lhs, .equal, rhs))
}

/// label.anchors.width == \.height ~ .xxx
public func == <LHSBase, RHS: ConstraintOperand>(
    lhs: SingleAnchor<LHSBase, Width>,
    rhs: RHS
) where
    RHS.Value == KeyPath<Anchors<LHSBase>, SingleAnchor<LHSBase, Height>>
{
    Layout.push(Constraint(lhs, .equal, rhs))
}

/// label.anchors.height == \.width ~ .xxx
public func == <LHSBase, RHS: ConstraintOperand>(
    lhs: SingleAnchor<LHSBase, Height>,
    rhs: RHS
) where
    RHS.Value == KeyPath<Anchors<LHSBase>, SingleAnchor<LHSBase, Width>>
{
    Layout.push(Constraint(lhs, .equal, rhs))
}

/// label.anchors.width <= \.height
public func <= <LHSBase>(
    lhs: SingleAnchor<LHSBase, Width>,
    rhs: KeyPath<Anchors<LHSBase>, SingleAnchor<LHSBase, Height>>
) {
    Layout.push(Constraint(lhs, .lessThanOrEqual, rhs))
}

/// label.anchors.height <= \.width
public func <= <LHSBase>(
    lhs: SingleAnchor<LHSBase, Height>,
    rhs: KeyPath<Anchors<LHSBase>, SingleAnchor<LHSBase, Width>>
) {
    Layout.push(Constraint(lhs, .lessThanOrEqual, rhs))
}

/// label.anchors.width <= \.height ~ .xxx
public func <= <LHSBase, RHS: ConstraintOperand>(
    lhs: SingleAnchor<LHSBase, Width>,
    rhs: RHS
) where
    RHS.Value == KeyPath<Anchors<LHSBase>, SingleAnchor<LHSBase, Height>>
{
    Layout.push(Constraint(lhs, .lessThanOrEqual, rhs))
}

/// label.anchors.height <= \.width ~ .xxx
public func <= <LHSBase, RHS: ConstraintOperand>(
    lhs: SingleAnchor<LHSBase, Height>,
    rhs: RHS
) where
    RHS.Value == KeyPath<Anchors<LHSBase>, SingleAnchor<LHSBase, Width>>
{
    Layout.push(Constraint(lhs, .lessThanOrEqual, rhs))
}

/// label.anchors.width >= \.height
public func >= <LHSBase>(
    lhs: SingleAnchor<LHSBase, Width>,
    rhs: KeyPath<Anchors<LHSBase>, SingleAnchor<LHSBase, Height>>
) {
    Layout.push(Constraint(lhs, .greaterThanOrEqual, rhs))
}

/// label.anchors.height >= \.width
public func >= <LHSBase>(
    lhs: SingleAnchor<LHSBase, Height>,
    rhs: KeyPath<Anchors<LHSBase>, SingleAnchor<LHSBase, Width>>
) {
    Layout.push(Constraint(lhs, .greaterThanOrEqual, rhs))
}

/// label.anchors.width >= \.height ~ .xxx
public func >= <LHSBase, RHS: ConstraintOperand>(
    lhs: SingleAnchor<LHSBase, Width>,
    rhs: RHS
) where
    RHS.Value == KeyPath<Anchors<LHSBase>, SingleAnchor<LHSBase, Height>>
{
    Layout.push(Constraint(lhs, .greaterThanOrEqual, rhs))
}

/// label.anchors.height >= \.width ~ .xxx
public func >= <LHSBase, RHS: ConstraintOperand>(
    lhs: SingleAnchor<LHSBase, Height>,
    rhs: RHS
) where
    RHS.Value == KeyPath<Anchors<LHSBase>, SingleAnchor<LHSBase, Width>>
{
    Layout.push(Constraint(lhs, .greaterThanOrEqual, rhs))
}
