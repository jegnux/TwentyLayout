//
//  EdgesAnchor.swift
//  TwentyLayout-iOS
//
//  Created by Jérôme Alves on 13/01/2020.
//  Copyright © 2020 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public struct EdgesAnchor<
    Base: Constrainable & ModifiableConstraintOperand,
    TopAttribute: Attribute & ModifiableConstraintOperand,
    BottomAttribute: Attribute & ModifiableConstraintOperand,
    LeftAttribute: Attribute & ModifiableConstraintOperand,
    RightAttribute: Attribute & ModifiableConstraintOperand
    >
    where
    TopAttribute.Kind.ValueKind == PositionValueKind, TopAttribute.Axis == YAxis,
    BottomAttribute.Kind.ValueKind == PositionValueKind, BottomAttribute.Axis == YAxis,
    LeftAttribute.Kind.ValueKind == PositionValueKind, LeftAttribute.Axis == XAxis,
    RightAttribute.Kind.ValueKind == PositionValueKind, RightAttribute.Axis == XAxis
{

    internal let item: Base
    
    internal init(_ item: Base) {
        self.item = item
    }
    
    internal var top: SingleAnchor<Base, TopAttribute> {
        SingleAnchor(item)
    }

    internal var bottom: SingleAnchor<Base, BottomAttribute> {
        SingleAnchor(item)
    }

    internal var left: SingleAnchor<Base, LeftAttribute> {
        SingleAnchor(item)
    }

    internal var right: SingleAnchor<Base, RightAttribute> {
        SingleAnchor(item)
    }

}
