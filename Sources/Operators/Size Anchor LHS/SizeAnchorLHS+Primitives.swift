//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

/// label.anchors.size == 20
public func == <
    LHSBase: UIView,
    RHS: ConstraintOperand
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value: SingleAnchorPrimitive
{
    lhs.width == rhs
    lhs.height == rhs
}

/// label.anchors.size <= 20
public func <= <
    LHSBase: UIView,
    RHS: ConstraintOperand
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value: SingleAnchorPrimitive
{
    lhs.width <= rhs
    lhs.height <= rhs
}

/// label.anchors.size >= 20
public func >= <
    LHSBase: UIView,
    RHS: ConstraintOperand
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value: SingleAnchorPrimitive
{
    lhs.width >= rhs
    lhs.height >= rhs
}

/// label.anchors.size == CGSize(width: 200, height: 400)
public func == <
    LHSBase: UIView,
    RHS: ConstraintOperand
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value == CGSize
{
    lhs.width == rhs.constraintValue.width ~ rhs
    lhs.height == rhs.constraintValue.height ~ rhs
}

/// label.anchors.size <= CGSize(width: 200, height: 400)
public func <= <
    LHSBase: UIView,
    RHS: ConstraintOperand
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value == CGSize
{
    lhs.width <= rhs.constraintValue.width ~ rhs
    lhs.height <= rhs.constraintValue.height ~ rhs
}

/// label.anchors.size >= CGSize(width: 200, height: 400)
public func >= <
    LHSBase: UIView,
    RHS: ConstraintOperand
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value == CGSize
{
    lhs.width >= rhs.constraintValue.width ~ rhs
    lhs.height >= rhs.constraintValue.height ~ rhs
}
