//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

/// label.anchors.top.width.centerY == wrapper
public func == <LHSBase, RHS: ConstraintOperand>(
    lhs: SetAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value: Constrainable
{
    for attribute in lhs.constraintAttributes {
        Layout.push(Constraint(lhs.item, attribute, .equal, rhs, attribute))
    }
}

/// label.anchors.top.width.centerY <= wrapper
public func <= <LHSBase, RHS: ConstraintOperand>(
    lhs: SetAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value: Constrainable
{
    for attribute in lhs.constraintAttributes {
        Layout.push(Constraint(lhs.item, attribute, .lessThanOrEqual, rhs, attribute))
    }
}

/// label.anchors.top.width.centerY >= wrapper
public func >= <LHSBase, RHS: ConstraintOperand>(
    lhs: SetAnchor<LHSBase>,
    rhs: RHS
) where
    RHS.Value: Constrainable
{
    for attribute in lhs.constraintAttributes {
        Layout.push(Constraint(lhs.item, attribute, .greaterThanOrEqual, rhs, attribute))
    }
}
