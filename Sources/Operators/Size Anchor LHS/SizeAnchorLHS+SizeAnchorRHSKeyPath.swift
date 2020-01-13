//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

/// label.anchors.size == \.image.anchors.size
public func == <
    LHSBase,
    RHSBase
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: KeyPath<LHSBase, SizeAnchor<RHSBase>>
) {
    lhs.width == lhs.item[keyPath: rhs.constraintValue].width ~ rhs
    lhs.height == lhs.item[keyPath: rhs.constraintValue].height ~ rhs
}

/// label.anchors.size == \.image.anchors.size
public func == <
    LHSBase,
    RHS: ConstraintOperand, RHSBase
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, SizeAnchor<RHSBase>>
{
    lhs.width == lhs.item[keyPath: rhs.constraintValue].width ~ rhs
    lhs.height == lhs.item[keyPath: rhs.constraintValue].height ~ rhs
}


/// label.anchors.size <= \.image.anchors.size
public func <= <
    LHSBase,
    RHSBase
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: KeyPath<LHSBase, SizeAnchor<RHSBase>>
) {
    lhs.width <= lhs.item[keyPath: rhs.constraintValue].width ~ rhs
    lhs.height <= lhs.item[keyPath: rhs.constraintValue].height ~ rhs
}


/// label.anchors.size <= \.image.anchors.size
public func <= <
    LHSBase,
    RHS: ConstraintOperand, RHSBase
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, SizeAnchor<RHSBase>>
{
    lhs.width <= lhs.item[keyPath: rhs.constraintValue].width ~ rhs
    lhs.height <= lhs.item[keyPath: rhs.constraintValue].height ~ rhs
}

/// label.anchors.size >= \.image.anchors.size
public func >= <
    LHSBase,
    RHSBase
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: KeyPath<LHSBase, SizeAnchor<RHSBase>>
) {
    lhs.width >= lhs.item[keyPath: rhs.constraintValue].width ~ rhs
    lhs.height >= lhs.item[keyPath: rhs.constraintValue].height ~ rhs
}

/// label.anchors.size >= \.image.anchors.size
public func >= <
    LHSBase,
    RHS: ConstraintOperand, RHSBase
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value == KeyPath<LHSBase, SizeAnchor<RHSBase>>
{
    lhs.width >= lhs.item[keyPath: rhs.constraintValue].width ~ rhs
    lhs.height >= lhs.item[keyPath: rhs.constraintValue].height ~ rhs
}
