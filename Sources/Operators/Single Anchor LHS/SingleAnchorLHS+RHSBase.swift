//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation


/// label.anchors.leading == button
public func == <
    LHSBase, LHSAttribute,
    RHS: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value : Constrainable
{
    Layout.push(Constraint(lhs, .equal, rhs))
}

/// label.anchors.leading <= button
public func <= <
    LHSBase, LHSAttribute,
    RHS: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value : Constrainable
{
    Layout.push(Constraint(lhs, .lessThanOrEqual, rhs))
}

/// label.anchors.leading >= button
public func >= <
    LHSBase, LHSAttribute,
    RHS: ConstraintOperand
    >(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: RHS
) where
    RHS.Value : Constrainable
{
    Layout.push(Constraint(lhs, .greaterThanOrEqual, rhs))
}
