//
//  Created by Jérôme Alves on 06/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public struct SingleAnchor<Base: Constrainable, Attribute: TwentyLayout.Attribute & ModifiableConstraintOperand> {

    internal init(_ item: Base) {
        self.item = item
    }

    public private(set) var item: Base
    public var constraintAttribute: NSLayoutConstraint.Attribute {
        Attribute.rawValue
    }
    
    internal func on<U>(_ newItem: U?) -> SingleAnchor<U, Attribute>? {
        guard let newItem = newItem else { return nil }
        return SingleAnchor<U, Attribute>(newItem)
    }
        
    internal func on<U>(_ newItem: KeyPath<Base, U>) -> SingleAnchor<U, Attribute>? {
        return on(item[keyPath: newItem])
    }

    internal func on<U>(_ newItem: KeyPath<Base, U?>) -> SingleAnchor<U, Attribute>? {
        guard let base = item[keyPath: newItem] else {
            return nil
        }
        return on(base)
    }

    internal func appending(_ constraintAttribute: NSLayoutConstraint.Attribute) -> SetAnchor<Base> {
        return SetAnchor(item, [self.constraintAttribute, constraintAttribute])
    }

}
