//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

/// label.anchors.size == image
public func == <
    LHSBase,
    RHS: ConstraintOperand
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value : Constrainable
{
    Layout.push(Constraint(lhs.width, .equal, rhs))
    Layout.push(Constraint(lhs.height, .equal, rhs))
}


/// label.anchors.size <= image
public func <= <
    LHSBase,
    RHS: ConstraintOperand
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value : Constrainable
{
    Layout.push(Constraint(lhs.width, .lessThanOrEqual, rhs))
    Layout.push(Constraint(lhs.height, .lessThanOrEqual, rhs))
}


/// label.anchors.size >= image
public func >= <
    LHSBase,
    RHS: ConstraintOperand
    >(
    lhs: SizeAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value : Constrainable
{
    Layout.push(Constraint(lhs.width, .greaterThanOrEqual, rhs))
    Layout.push(Constraint(lhs.height, .greaterThanOrEqual, rhs))
}
