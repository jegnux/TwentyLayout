//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public struct PointAnchor<Base: Constrainable, XAttribute: Attribute & ModifiableConstraintOperand, YAttribute: Attribute & ModifiableConstraintOperand>
    where
    XAttribute.Kind.ValueKind == PositionValueKind, XAttribute.Axis == XAxis,
    YAttribute.Kind.ValueKind == PositionValueKind, YAttribute.Axis == YAxis
{
    public let item: Base
    public var constraintAttributes: [NSLayoutConstraint.Attribute] {
        [XAttribute().rawValue, YAttribute().rawValue]
    }

    internal init(_ item: Base){
        self.item = item
    }

    internal func appending(_ constraintAttribute: NSLayoutConstraint.Attribute) -> CompoundAnchor<Base> {
        return CompoundAnchor(item, constraintAttributes + [constraintAttribute])
    }
    
    internal var xAnchor: SingleAnchor<Base, XAttribute> {
        SingleAnchor(item)
    }

    internal var yAnchor: SingleAnchor<Base, YAttribute> {
        SingleAnchor(item)
    }
}
