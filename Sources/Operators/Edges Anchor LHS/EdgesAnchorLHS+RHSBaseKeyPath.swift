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
    RHSBase: Constrainable
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: KeyPath<LHSBase, RHSBase>
) {
    lhs.top == rhs
    lhs.bottom == rhs
    lhs.left == rhs
    lhs.right == rhs
}

/// label.anchors.edges == \.otherLabel ~ .xxx
public func == <
    LHSBase,
    LHSTop, LHSBottom, LHSLeft, LHSRight,
    RHS: ConstraintOperand, RHSBase: Constrainable
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, RHSBase>
{
    lhs.top == rhs
    lhs.bottom == rhs
    lhs.left == rhs
    lhs.right == rhs
}

/// label.anchors.edges <= \.otherLabel
public func <= <
    LHSBase,
    LHSTop, LHSBottom, LHSLeft, LHSRight,
    RHSBase: Constrainable
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: KeyPath<LHSBase, RHSBase>
) {
    lhs.top >= rhs
    lhs.bottom <= rhs
    lhs.left >= rhs
    lhs.right <= rhs
}

/// label.anchors.edges <= \.otherLabel ~ .xxx
public func <= <
    LHSBase,
    LHSTop, LHSBottom, LHSLeft, LHSRight,
    RHS: ConstraintOperand, RHSBase: Constrainable
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, RHSBase>
{
    lhs.top >= rhs
    lhs.bottom <= rhs
    lhs.left >= rhs
    lhs.right <= rhs
}

/// label.anchors.edges >= \.otherLabel
public func >= <
    LHSBase,
    LHSTop, LHSBottom, LHSLeft, LHSRight,
    RHSBase: Constrainable
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: KeyPath<LHSBase, RHSBase>
) {
    lhs.top <= rhs
    lhs.bottom >= rhs
    lhs.left <= rhs
    lhs.right >= rhs
}

/// label.anchors.edges >= \.otherLabel ~ .xxx
public func >= <
    LHSBase,
    LHSTop, LHSBottom, LHSLeft, LHSRight,
    RHS: ConstraintOperand, RHSBase: Constrainable
    >(
    lhs: EdgesAnchor<LHSBase, LHSTop, LHSBottom, LHSLeft, LHSRight>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, RHSBase>
{
    lhs.top <= rhs
    lhs.bottom >= rhs
    lhs.left <= rhs
    lhs.right >= rhs
}
