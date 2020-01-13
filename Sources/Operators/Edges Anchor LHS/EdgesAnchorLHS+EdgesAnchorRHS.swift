//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

/// label.anchors.edges == otherLabel.anchors.margins ~ .xxx
public func == <
    LHSBase,
    LHSTop, LHSBottom, LHSLeft, LHSRight,
    RHS: ConstraintOperand,
    RHSBase,
    RHSTop, RHSBottom, RHSLeft, RHSRight
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: RHS?
) where
    RHS.Value == EdgesAnchor<RHSBase, RHSTop, RHSBottom, RHSLeft, RHSRight>
{
    guard let rhs = rhs else { return }
    lhs.top == rhs.constraintValue.top ~ rhs
    lhs.bottom == rhs.constraintValue.bottom ~ rhs
    lhs.left == rhs.constraintValue.left ~ rhs
    lhs.right == rhs.constraintValue.right ~ rhs
}

/// label.anchors.edges <= otherLabel.anchors.margins ~ .xxx
public func <= <
    LHSBase,
    LHSTop, LHSBottom, LHSLeft, LHSRight,
    RHS: ConstraintOperand,
    RHSBase,
    RHSTop, RHSBottom, RHSLeft, RHSRight
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: RHS?
) where
    RHS.Value == EdgesAnchor<RHSBase, RHSTop, RHSBottom, RHSLeft, RHSRight>
{
    guard let rhs = rhs else { return }
    lhs.top <= rhs.constraintValue.top ~ rhs
    lhs.bottom >= rhs.constraintValue.bottom ~ rhs
    lhs.left <= rhs.constraintValue.left ~ rhs
    lhs.right >= rhs.constraintValue.right ~ rhs
}

/// label.anchors.edges >= otherLabel.anchors.margin ~ .xxx
public func >= <
    LHSBase,
    LHSTop, LHSBottom, LHSLeft, LHSRight,
    RHS: ConstraintOperand,
    RHSBase,
    RHSTop, RHSBottom, RHSLeft, RHSRight
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: RHS?
) where
    RHS.Value == EdgesAnchor<RHSBase, RHSTop, RHSBottom, RHSLeft, RHSRight>
{
    guard let rhs = rhs else { return }
    lhs.top >= rhs.constraintValue.top ~ rhs
    lhs.bottom <= rhs.constraintValue.bottom ~ rhs
    lhs.left >= rhs.constraintValue.left ~ rhs
    lhs.right <= rhs.constraintValue.right ~ rhs
}
