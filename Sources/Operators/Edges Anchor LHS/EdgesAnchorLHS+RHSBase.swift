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
    RHS: ConstraintOperand
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: RHS?
) where
    RHS.Value: Constrainable
{
    guard let rhs = rhs else { return }
    lhs.top == rhs.constraintValue ~ rhs
    lhs.bottom == rhs.constraintValue ~ rhs
    lhs.left == rhs.constraintValue ~ rhs
    lhs.right == rhs.constraintValue ~ rhs
}

/// label.anchors.edges <= otherLabel.anchors.margins ~ .xxx
public func <= <
    LHSBase,
    LHSTop, LHSBottom, LHSLeft, LHSRight,
    RHS: ConstraintOperand
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: RHS?
) where
    RHS.Value: Constrainable
{
    guard let rhs = rhs else { return }
    lhs.top >= rhs.constraintValue ~ rhs
    lhs.bottom <= rhs.constraintValue ~ rhs
    lhs.left >= rhs.constraintValue ~ rhs
    lhs.right <= rhs.constraintValue ~ rhs
}

/// label.anchors.edges >= otherLabel.anchors.margin ~ .xxx
public func >= <
    LHSBase,
    LHSTop, LHSBottom, LHSLeft, LHSRight,
    RHS: ConstraintOperand
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: RHS?
) where
    RHS.Value: Constrainable
{
    guard let rhs = rhs else { return }
    lhs.top <= rhs.constraintValue ~ rhs
    lhs.bottom >= rhs.constraintValue ~ rhs
    lhs.left <= rhs.constraintValue ~ rhs
    lhs.right >= rhs.constraintValue ~ rhs
}

