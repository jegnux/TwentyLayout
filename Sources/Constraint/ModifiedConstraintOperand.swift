//
//  ModifiedConstraintOperand.swift
//  TwentyLayout-iOS
//
//  Created by Jérôme Alves on 14/01/2020.
//  Copyright © 2020 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public struct ModifiedConstraintOperand<T: ModifiableConstraintOperand>: ConstraintOperand {
    
    public var constraintValue: T {
        return original
    }
    
    public internal(set) var priority: UILayoutPriority?
    public internal(set) var multiplier: CGFloat?
    
    internal var constant: (NSLayoutConstraint.Attribute) -> CGFloat?
    
    public let original: T
    
    internal init(original: T) {
        self.original = original
        self.priority = original.priority
        self.multiplier = original.multiplier
        self.constant = original.constant
    }

    internal init<U: ConstraintOperand>(original: T, other: U) {
        self.original = original
        self.priority = other.priority
        self.multiplier = other.multiplier
        self.constant = other.constant
    }

    public func constant(for attribute: NSLayoutConstraint.Attribute) -> CGFloat? {
        constant(attribute)
    }
    
}
