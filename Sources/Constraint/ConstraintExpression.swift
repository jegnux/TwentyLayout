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
    fileprivate init(_ item: AnyObject) {
        self.object = item
        self.objectHashValue = withUnsafePointer(to: item, { $0.hashValue })
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

    internal init(_ item: AnyObject, _ constraintAttribute: NSLayoutConstraint.Attribute) {
        self.item = ConstraintItem(item)
        self.constraintAttribute = constraintAttribute
    }
}
