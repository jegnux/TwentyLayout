//
//  Created by Jérôme Alves on 06/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public protocol ConstraintOperand {
    associatedtype Value
    var constraintValue: Value {get }
    var priority: UILayoutPriority? { get }
    var multiplier: CGFloat? { get }
    func constant(for attribute: NSLayoutConstraint.Attribute) -> CGFloat?
}

extension ConstraintOperand {
    public var constraintValue: Self {
        return self
    }
    public var priority: UILayoutPriority? {
        return nil
    }
    public var multiplier: CGFloat? {
        return nil
    }
    public func constant(for attribute: NSLayoutConstraint.Attribute) -> CGFloat? {
        return nil
    }
}

public protocol Insetable {}
public protocol Offsetable {}
public protocol Multiplicable {}
public protocol SingleAnchorPrimitive { }
public protocol ModifiableConstraintOperand: ConstraintOperand { }
