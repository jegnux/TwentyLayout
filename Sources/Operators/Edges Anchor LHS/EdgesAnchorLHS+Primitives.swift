//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

/// label.anchors.edges == .inset(by: 40)
public func == <
    LHSBase: UIView,
    LHSTop, LHSBottom, LHSLeft, LHSRight
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: EdgesConstants
) {
    lhs.top == rhs.constant(for: .top)!
    lhs.bottom == rhs.constant(for: .bottom)!
    lhs.left == rhs.constant(for: .left)!
    lhs.right == rhs.constant(for: .right)!
}

/// label.anchors.edges ==  .inset(by: 40) ~ .xxx
public func == <
    LHSBase: UIView,
    LHSTop, LHSBottom, LHSLeft, LHSRight,
    RHS: ConstraintOperand
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: RHS
) where
    RHS.Value == EdgesConstants
{
    lhs.top == rhs.constant(for: .top)! ~ rhs
    lhs.bottom == rhs.constant(for: .bottom)! ~ rhs
    lhs.left == rhs.constant(for: .left)! ~ rhs
    lhs.right == rhs.constant(for: .right)! ~ rhs
}

/// label.anchors.edges <= .inset(by: 40)
public func <= <
    LHSBase: UIView,
    LHSTop, LHSBottom, LHSLeft, LHSRight
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: EdgesConstants
) {
    lhs.top >= rhs.constant(for: .top)!
    lhs.bottom <= rhs.constant(for: .bottom)!
    lhs.left >= rhs.constant(for: .left)!
    lhs.right <= rhs.constant(for: .right)!
}

/// label.anchors.edges <=  .inset(by: 40) ~ .xxx
public func <= <
    LHSBase: UIView,
    LHSTop, LHSBottom, LHSLeft, LHSRight,
    RHS: ConstraintOperand
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: RHS
) where
    RHS.Value == EdgesConstants
{
    lhs.top >= rhs.constant(for: .top)! ~ rhs
    lhs.bottom <= rhs.constant(for: .bottom)! ~ rhs
    lhs.left >= rhs.constant(for: .left)! ~ rhs
    lhs.right <= rhs.constant(for: .right)! ~ rhs
}

/// label.anchors.edges >= .inset(by: 40)
public func >= <
    LHSBase: UIView,
    LHSTop, LHSBottom, LHSLeft, LHSRight
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: EdgesConstants
) {
    lhs.top <= rhs.constant(for: .top)!
    lhs.bottom >= rhs.constant(for: .bottom)!
    lhs.left <= rhs.constant(for: .left)!
    lhs.right >= rhs.constant(for: .right)!
}

/// label.anchors.edges >=  .inset(by: 40) ~ .xxx
public func >= <
    LHSBase: UIView,
    LHSTop, LHSBottom, LHSLeft, LHSRight,
    RHS: ConstraintOperand
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: RHS
) where
    RHS.Value == EdgesConstants
{
    lhs.top <= rhs.constant(for: .top)! ~ rhs
    lhs.bottom >= rhs.constant(for: .bottom)! ~ rhs
    lhs.left <= rhs.constant(for: .left)! ~ rhs
    lhs.right >= rhs.constant(for: .right)! ~ rhs
}
