//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

/// label.anchors.top.width.centerY == wrapper
public func == <LHSBase, RHS: ConstraintOperand>(
    lhs: SetAnchor<LHSBase>,
    rhs: KeyPath<LHSBase, RHS>
)  where
    RHS.Value: Constrainable
{
    for attribute in lhs.constraintAttributes {
        Layout.push(Constraint(lhs.item, attribute, .equal, lhs.item[keyPath: rhs], attribute))
    }
}

public func == <LHSBase, RHS: ConstraintOperand, RHSBase: Constrainable & ModifiableConstraintOperand>(
    lhs: SetAnchor<LHSBase>,
    rhs: RHS
)  where
    RHS.Value == KeyPath<LHSBase, RHSBase>,
    RHSBase.Value: Constrainable
{
    for attribute in lhs.constraintAttributes {
        Layout.push(Constraint(lhs.item, attribute, .equal, lhs.item[keyPath: rhs.constraintValue] ~ rhs, attribute))
    }
}

/// label.anchors.top.width.centerY <= wrapper
public func <= <LHSBase, RHS: ConstraintOperand>(
    lhs: SetAnchor<LHSBase>,
    rhs: KeyPath<LHSBase, RHS>
)  where
   RHS.Value: Constrainable
{
    for attribute in lhs.constraintAttributes {
        Layout.push(Constraint(lhs.item, attribute, .lessThanOrEqual, lhs.item[keyPath: rhs], attribute))
    }
}

public func <= <LHSBase, RHS: ConstraintOperand, RHSBase: Constrainable & ModifiableConstraintOperand>(
    lhs: SetAnchor<LHSBase>,
    rhs: RHS
)  where
    RHS.Value == KeyPath<LHSBase, RHSBase>,
    RHSBase.Value: Constrainable
{
    for attribute in lhs.constraintAttributes {
        Layout.push(Constraint(lhs.item, attribute, .lessThanOrEqual, lhs.item[keyPath: rhs.constraintValue] ~ rhs, attribute))
    }
}

/// label.anchors.top.width.centerY >= wrapper
public func >= <LHSBase, RHS: ConstraintOperand>(
    lhs: SetAnchor<LHSBase>,
    rhs: KeyPath<LHSBase, RHS>
)  where
   RHS.Value: Constrainable
{
    for attribute in lhs.constraintAttributes {
        Layout.push(Constraint(lhs.item, attribute, .greaterThanOrEqual, lhs.item[keyPath: rhs], attribute))
    }
}

public func >= <LHSBase, RHS: ConstraintOperand, RHSBase: Constrainable & ModifiableConstraintOperand>(
    lhs: SetAnchor<LHSBase>,
    rhs: RHS
)  where
    RHS.Value == KeyPath<LHSBase, RHSBase>,
    RHSBase.Value: Constrainable
{
    for attribute in lhs.constraintAttributes {
        Layout.push(Constraint(lhs.item, attribute, .greaterThanOrEqual, lhs.item[keyPath: rhs.constraintValue] ~ rhs, attribute))
    }
}
