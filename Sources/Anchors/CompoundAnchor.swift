//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public struct CompoundAnchor<Base: Constrainable> {
    public let item: Base
    public var constraintAttributes: [NSLayoutConstraint.Attribute]

    internal init(_ item: Base, _ constraintAttributes: [NSLayoutConstraint.Attribute]) {
        self.item = item
        self.constraintAttributes = constraintAttributes
    }

    internal func appending(_ constraintAttribute: NSLayoutConstraint.Attribute) -> CompoundAnchor<Base> {
        var new = self
        new.constraintAttributes.append(constraintAttribute)
        return new
    }
}
