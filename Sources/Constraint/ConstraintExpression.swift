//
//  Created by Jérôme Alves on 06/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

internal struct ConstraintItem: Hashable, CustomStringConvertible {
    static func == (lhs: ConstraintItem, rhs: ConstraintItem) -> Bool {
        return lhs.object === rhs.object
    }
    internal let object: AnyObject
    internal let objectHashValue: Int
    fileprivate init<T: Constrainable>(_ item: T) {
        self.object = item
        self.objectHashValue = item.hashValue
    }
    internal func hash(into hasher: inout Hasher) {
        hasher.combine(objectHashValue)
    }
    
    internal var description: String {
        rawDescription(of: object)
    }
}

internal struct ConstraintExpression: Hashable {
    internal let item: ConstraintItem
    internal let constraintAttribute: NSLayoutConstraint.Attribute

    internal init<Base, T>(_ attribute: SingleAnchor<Base, T>) {
        self.item = ConstraintItem(attribute.item)
        self.constraintAttribute = attribute.constraintAttribute
    }

    internal init<T: Constrainable>(_ item: T, _ constraintAttribute: NSLayoutConstraint.Attribute) {
        self.item = ConstraintItem(item)
        self.constraintAttribute = constraintAttribute
    }
}
