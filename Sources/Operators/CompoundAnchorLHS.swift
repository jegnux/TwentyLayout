//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

/// label.anchors.edges == wrapper
public func == <LHSBase, RHSBase: Constrainable>(
    lhs: CompoundAnchor<LHSBase>,
    rhs: RHSBase
) {
    for attribute in lhs.constraintAttributes {
        Layout.push(Constraint(lhs.item, attribute, .equal, rhs, attribute))
    }
}

/// label.anchors.edges == wrapper.offset(by: 8)
public func == <LHSBase, RHSBase>(
    lhs: CompoundAnchor<LHSBase>,
    rhs: ModifiableConstraintItem<RHSBase>
) {
    for attribute in lhs.constraintAttributes {
        Layout.push(lhs.item, attribute, .equal, rhs.item, attribute, rhs.constraintProperties)
    }
}

/// label.anchors.edges == its(\.superview)
public func == <LHSBase, RHSBase: Constrainable>(
    lhs: CompoundAnchor<LHSBase>,
    rhs: ModifiableKeyPath<LHSBase, RHSBase?>
) {
    for attribute in lhs.constraintAttributes {
        Layout.push(lhs.item, attribute, .equal, lhs.item[keyPath: rhs.keyPath], attribute, rhs.constraintProperties)
    }
}

