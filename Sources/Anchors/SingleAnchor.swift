//
//  Created by Jérôme Alves on 06/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public struct SingleAnchor<Base: Constrainable, Attribute: TwentyLayout.Attribute>: ConstraintModifier {

    internal init(_ item: Base, _ constraintProperties: ConstraintProperties = ConstraintProperties()) {
        self.item = item
        self.constraintProperties = constraintProperties
    }

    public private(set) var item: Base
    public var constraintAttribute: NSLayoutConstraint.Attribute {
        Attribute().rawValue
    }
    public var constraintProperties: ConstraintProperties
    
    internal func on<U>(_ newItem: U?, _ constraintProperties: ConstraintProperties = ConstraintProperties()) -> SingleAnchor<U, Attribute>? {
        guard let newItem = newItem else { return nil }
        return SingleAnchor<U, Attribute>(newItem, constraintProperties)
    }
    
    internal func on<U>(_ newItem: ModifiableConstraintItem<U>?) -> SingleAnchor<U, Attribute>? {
        guard let newItem = newItem else { return nil }
        return SingleAnchor<U, Attribute>(newItem.item, newItem.constraintProperties)
    }
    
    internal func on<U>(_ newItem: KeyPath<Base, U?>?) -> SingleAnchor<U, Attribute>? {
        guard let newItem = newItem else { return nil }
        return on(item[keyPath: newItem])
    }

    internal func on<U>(_ newItem: ModifiableKeyPath<Base, U?>?) -> SingleAnchor<U, Attribute>? {
        guard let newItem = newItem else { return nil }
        return on(item[keyPath: newItem.keyPath], newItem.constraintProperties)
    }

}
