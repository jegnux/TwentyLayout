//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

/// label.anchors.edges == \.otherLabel
public func == <
    LHSBase,
    LHSTop, LHSBottom, LHSLeft, LHSRight,
    RHSBase,
    RHSTop, RHSBottom, RHSLeft, RHSRight
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: KeyPath<LHSBase, EdgesAnchor<RHSBase, RHSTop, RHSBottom, RHSLeft, RHSRight>>
) {
    lhs == lhs.item[keyPath: rhs]
}

/// label.anchors.edges == \.otherLabel ~ .xxx
public func == <
    LHSBase,
    LHSTop, LHSBottom, LHSLeft, LHSRight,
    RHS: ConstraintOperand,
    RHSBase,
    RHSTop, RHSBottom, RHSLeft, RHSRight
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, EdgesAnchor<RHSBase, RHSTop, RHSBottom, RHSLeft, RHSRight>>
{
    lhs == lhs.item[keyPath: rhs.constraintValue] ~ rhs
}

/// label.anchors.edges <= \.otherLabel
public func <= <
    LHSBase,
    LHSTop, LHSBottom, LHSLeft, LHSRight,
    RHSBase,
    RHSTop, RHSBottom, RHSLeft, RHSRight
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: KeyPath<LHSBase, EdgesAnchor<RHSBase, RHSTop, RHSBottom, RHSLeft, RHSRight>>
) {
    lhs <= lhs.item[keyPath: rhs]
}

/// label.anchors.edges <= \.otherLabel ~ .xxx
public func <= <
    LHSBase,
    LHSTop, LHSBottom, LHSLeft, LHSRight,
    RHS: ConstraintOperand,
    RHSBase,
    RHSTop, RHSBottom, RHSLeft, RHSRight
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, EdgesAnchor<RHSBase, RHSTop, RHSBottom, RHSLeft, RHSRight>>
{
    lhs <= lhs.item[keyPath: rhs.constraintValue] ~ rhs
}

/// label.anchors.edges >= \.otherLabel
public func >= <
    LHSBase,
    LHSTop, LHSBottom, LHSLeft, LHSRight,
    RHSBase,
    RHSTop, RHSBottom, RHSLeft, RHSRight
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: KeyPath<LHSBase, EdgesAnchor<RHSBase, RHSTop, RHSBottom, RHSLeft, RHSRight>>
) {
    lhs >= lhs.item[keyPath: rhs]
}

/// label.anchors.edges >= \.otherLabel ~ .xxx
public func >= <
    LHSBase,
    LHSTop, LHSBottom, LHSLeft, LHSRight,
    RHS: ConstraintOperand,
    RHSBase,
    RHSTop, RHSBottom, RHSLeft, RHSRight
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, EdgesAnchor<RHSBase, RHSTop, RHSBottom, RHSLeft, RHSRight>>
{
    lhs >= lhs.item[keyPath: rhs.constraintValue] ~ rhs
}
