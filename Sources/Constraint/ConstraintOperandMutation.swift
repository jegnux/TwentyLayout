//
//  ConstraintOperandMutation.swift
//  TwentyLayout-iOS
//
//  Created by Jérôme Alves on 14/01/2020.
//  Copyright © 2020 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public struct ConstraintOperandMutation<T: ModifiableConstraintOperand> {
    internal let mutation: (ModifiedConstraintOperand<T>, inout ModifiedConstraintOperand<T>) -> Void
    
    internal func mutating(_ value: T) -> ModifiedConstraintOperand<T> {
        return mutating(ModifiedConstraintOperand(original: value))
    }
    
    internal func mutating(_ value: ModifiedConstraintOperand<T>) -> ModifiedConstraintOperand<T> {
        var copy = value
        mutation(value, &copy)
        return copy
    }
}

extension ConstraintOperandMutation {
    
    public static func priority(_ priority: UILayoutPriority) -> ConstraintOperandMutation<T> {
        return ConstraintOperandMutation<T> { _, new in
            new.priority = priority
        }
    }
 
    @available(*, unavailable, message: "You can't add an offset on this kind of constraint")
    public static func offset<I: BinaryInteger>(by integer: I) -> ConstraintOperandMutation<T> {
        return ConstraintOperandMutation<T> { _, _ in }
    }

    @available(*, unavailable, message: "You can't add an offset on this kind of constraint")
    public static func offset<F: BinaryFloatingPoint>(by float: F) -> ConstraintOperandMutation<T> {
        return ConstraintOperandMutation<T> { _, _ in }
    }

    @available(*, unavailable, message: "You can't add an offset on this kind of constraint")
    public static func offset(by insets: UIEdgeInsets) -> ConstraintOperandMutation<T> {
        return ConstraintOperandMutation<T> { _, _ in }
    }

    @available(*, unavailable, message: "You can't add an inset on this kind of constraint")
    public static func inset<T>(by insets: UIEdgeInsets) -> ConstraintOperandMutation<T> {
        return ConstraintOperandMutation<T> { _, _ in }
    }

    @available(*, unavailable, message: "You can't add a multiplier on this kind of constraint")
    public static func multiplied(by multiplier: CGFloat) -> ConstraintOperandMutation<T> {
        return ConstraintOperandMutation<T> { _, _ in }
    }
    
}

extension ConstraintOperandMutation where T: Offsetable {
    public static func offset<I: BinaryInteger>(top: I = 0, left: I = 0, bottom: I = 0, right: I = 0) -> ConstraintOperandMutation<T> {
        return offset(by: UIEdgeInsets(top: CGFloat(top), left: CGFloat(left), bottom: CGFloat(bottom), right: CGFloat(right)))
    }

    public static func offset<I: BinaryInteger>(by integer: I) -> ConstraintOperandMutation<T> {
        return ConstraintOperandMutation<T> { old, new in
            new.constant = { attribute in
                return CGFloat(integer) + (old.constant(attribute) ?? 0)
            }
        }
    }

    public static func offset<F: BinaryFloatingPoint>(top: F = 0, left: F = 0, bottom: F = 0, right: F = 0) -> ConstraintOperandMutation<T> {
        return offset(by: UIEdgeInsets(top: CGFloat(top), left: CGFloat(left), bottom: CGFloat(bottom), right: CGFloat(right)))
    }

    public static func offset<F: BinaryFloatingPoint>(by float: F) -> ConstraintOperandMutation<T> {
        return ConstraintOperandMutation<T> { old, new in
            new.constant = { attribute in
                return CGFloat(float) + (old.constant(attribute) ?? 0)
            }
        }
    }
    
    public static func offset(by insets: UIEdgeInsets) -> ConstraintOperandMutation<T> {
        return ConstraintOperandMutation<T> { old, new in
            new.constant = { attribute in
                switch (old.constant(attribute), insets.offset(for: attribute)) {
                case (let x?, let y?): return x + y
                case (let x?, nil): return x
                case (nil, let y?): return y
                case (nil, nil): return nil
                }
            }
        }
    }
}

extension ConstraintOperandMutation where T: Insetable {
    public static func inset<I: BinaryInteger>(top: I = 0, left: I = 0, bottom: I = 0, right: I = 0) -> ConstraintOperandMutation<T> {
        return inset(by: UIEdgeInsets(top: CGFloat(top), left: CGFloat(left), bottom: CGFloat(bottom), right: CGFloat(right)))
    }

    public static func inset<I: BinaryInteger>(by integer: I) -> ConstraintOperandMutation<T> {
        let value = CGFloat(integer)
        return inset(by: UIEdgeInsets(top: value, left: value, bottom: value, right: value))
    }
    
    public static func inset<F: BinaryFloatingPoint>(top: F = 0, left: F = 0, bottom: F = 0, right: F = 0) -> ConstraintOperandMutation<T> {
        return inset(by: UIEdgeInsets(top: CGFloat(top), left: CGFloat(left), bottom: CGFloat(bottom), right: CGFloat(right)))
    }

    public static func inset<F: BinaryFloatingPoint>(by float: F) -> ConstraintOperandMutation<T> {
        let value = CGFloat(float)
        return inset(by: UIEdgeInsets(top: value, left: value, bottom: value, right: value))
    }

    public static func inset<T>(by insets: UIEdgeInsets) -> ConstraintOperandMutation<T> {
        return ConstraintOperandMutation<T> { old, new in
            new.constant = { attribute in
                switch (old.constant(attribute), insets.inset(for: attribute)) {
                case (let x?, let y?): return x + y
                case (let x?, nil): return x
                case (nil, let y?): return y
                case (nil, nil): return nil
                }
            }
        }
    }
}

extension ConstraintOperandMutation where T: Multiplicable {
    public static func multiplied(by multiplier: CGFloat) -> ConstraintOperandMutation<T> {
        return ConstraintOperandMutation<T> { _, new in
            new.multiplier = multiplier
        }
    }
}
