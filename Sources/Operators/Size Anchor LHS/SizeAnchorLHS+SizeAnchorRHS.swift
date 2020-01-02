//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

/// label.anchors.size == otherLabel.anchors.size ~ .xxx
public func == <LHSBase, RHS: ConstraintOperand, RHSBase>(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value == SizeAnchor<RHSBase>
{
    lhs.width == rhs.constraintValue.width ~ rhs
    lhs.height == rhs.constraintValue.height ~ rhs
}

/// label.anchors.size <= otherLabel.anchors.size ~ .xxx
public func <= <LHSBase, RHS: ConstraintOperand, RHSBase>(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value == SizeAnchor<RHSBase>
{
    lhs.width <= rhs.constraintValue.width ~ rhs
    lhs.height <= rhs.constraintValue.height ~ rhs
}

/// label.anchors.size >= otherLabel.anchors.size ~ .xxx
public func >= <LHSBase, RHS: ConstraintOperand, RHSBase>(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value == SizeAnchor<RHSBase>
{
    lhs.width >= rhs.constraintValue.width ~ rhs
    lhs.height >= rhs.constraintValue.height ~ rhs
}
