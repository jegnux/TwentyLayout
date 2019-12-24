//
//  Created by Jérôme Alves on 06/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public protocol Insetable {}
public protocol Offsetable {}
public protocol Multiplicable {}

public protocol ConstraintOperand {
    associatedtype Value
    var constraintValue: Value {get }
    var priority: UILayoutPriority? { get }
    var multiplier: CGFloat? { get }
    func constant(for attribute: NSLayoutConstraint.Attribute) -> CGFloat?
}

public protocol ModifiableConstraintOperand: ConstraintOperand { }

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

extension Int: ModifiableConstraintOperand {}
extension Float: ModifiableConstraintOperand {}
extension Double: ModifiableConstraintOperand {}
extension CGFloat: ModifiableConstraintOperand {}
//
//extension UIView: ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {}
//extension UILayoutGuide: ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {}

extension Top:  ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {}
extension Left: ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {}
extension Leading:  ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {}
extension Trailing: ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {}
extension Right:    ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {}
extension Bottom:   ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {}
extension CenterX:  ModifiableConstraintOperand, Offsetable, Multiplicable {}
extension CenterY:  ModifiableConstraintOperand, Offsetable, Multiplicable {}
extension Width:    ModifiableConstraintOperand, Offsetable, Multiplicable {}
extension Height:   ModifiableConstraintOperand, Offsetable, Multiplicable {}
extension FirstBaseline:    ModifiableConstraintOperand, Offsetable, Multiplicable {}
extension LastBaseline:     ModifiableConstraintOperand, Offsetable, Multiplicable {}

extension Margin: ConstraintOperand where T: ConstraintOperand {
    public var constraintValue: Self {
        return self
    }
}
extension Margin: ModifiableConstraintOperand where T: ModifiableConstraintOperand {}
extension Margin: Offsetable where T: Offsetable {}
extension Margin: Insetable where T: Insetable {}
extension Margin: Multiplicable where T: Multiplicable {}

extension WithinMargins: ConstraintOperand where T: ConstraintOperand {
    public var constraintValue: Self {
        return self
    }
}
extension WithinMargins: ModifiableConstraintOperand where T: ModifiableConstraintOperand {}
extension WithinMargins: Offsetable where T: Offsetable {}
extension WithinMargins: Insetable where T: Insetable {}
extension WithinMargins: Multiplicable where T: Multiplicable {}

extension SingleAnchor: ConstraintOperand where Attribute: ConstraintOperand {
    public var constraintValue: Self {
        return self
    }
}
extension SingleAnchor: ModifiableConstraintOperand where Attribute: ModifiableConstraintOperand {}
extension SingleAnchor: Offsetable where Attribute: Offsetable {}
extension SingleAnchor: Insetable where Attribute: Insetable {}
extension SingleAnchor: Multiplicable where Attribute: Multiplicable {}

extension PointAnchor: ConstraintOperand where XAttribute: ConstraintOperand, YAttribute: ConstraintOperand {
    public var constraintValue: Self {
        return self
    }
}
extension PointAnchor: ModifiableConstraintOperand where XAttribute: ModifiableConstraintOperand, YAttribute: ModifiableConstraintOperand {}
extension PointAnchor: Offsetable where XAttribute: Offsetable, YAttribute: Offsetable {}
extension PointAnchor: Insetable where XAttribute: Insetable, YAttribute: Insetable {}
extension PointAnchor: Multiplicable where XAttribute: Multiplicable, YAttribute: Multiplicable {}

extension KeyPath: ConstraintOperand where Value: ConstraintOperand {
    public var constraintValue: KeyPath {
        return self
    }
}
extension KeyPath: ModifiableConstraintOperand where Value: ModifiableConstraintOperand {}
extension KeyPath: Offsetable where Value: Offsetable {}
extension KeyPath: Insetable where Value: Insetable {}
extension KeyPath: Multiplicable where Value: Multiplicable {}

extension Optional: ConstraintOperand where Wrapped: ConstraintOperand {
    public var constraintValue: Wrapped? {
        return self
    }
}
extension Optional: ModifiableConstraintOperand where Wrapped: ModifiableConstraintOperand {}
extension Optional: Offsetable where Wrapped: Offsetable {}
extension Optional: Insetable where Wrapped: Insetable {}
extension Optional: Multiplicable where Wrapped: Multiplicable {}

extension CGSize: ModifiableConstraintOperand {
    public func constant(for attribute: NSLayoutConstraint.Attribute) -> CGFloat? {
        switch attribute {
        case .width: return width
        case .height: return height
        default: return nil
        }
    }
}

extension ConstraintOperand where Self : BinaryInteger {
    public func constant(for attribute: NSLayoutConstraint.Attribute) -> CGFloat? {
        return CGFloat(self)
    }
}

extension ConstraintOperand where Self : BinaryFloatingPoint {
    public func constant(for attribute: NSLayoutConstraint.Attribute) -> CGFloat? {
        return CGFloat(self)
    }
}

extension UIEdgeInsets {
    fileprivate func inset(for attribute: NSLayoutConstraint.Attribute) -> CGFloat? {
        switch attribute {
        case .left, .leading, .leftMargin, .leadingMargin:
            return self.left
        case .right, .trailing, .rightMargin, .trailingMargin:
            return -self.right
        case .top, .topMargin:
            return self.top
        case .bottom, .bottomMargin:
            return -self.bottom
        default:
            return nil
        }
    }
    
    fileprivate func offset(for attribute: NSLayoutConstraint.Attribute) -> CGFloat? {
        switch attribute {
        case .left, .leading, .leftMargin, .leadingMargin:
            return self.left
        case .right, .trailing, .rightMargin, .trailingMargin:
            return self.right
        case .top, .topMargin:
            return self.top
        case .bottom, .bottomMargin:
            return self.bottom
        default:
            return nil
        }
    }
}

public struct ModifiedConstraintOperand<T: ModifiableConstraintOperand>: ConstraintOperand {
    
    public var constraintValue: T {
        return original
    }
    
    public fileprivate(set) var priority: UILayoutPriority?
    public fileprivate(set) var multiplier: CGFloat?
    
    fileprivate var constant: (NSLayoutConstraint.Attribute) -> CGFloat?
    
    public let original: T
    
    fileprivate init(original: T) {
        self.original = original
        self.priority = original.priority
        self.multiplier = original.multiplier
        self.constant = original.constant
    }

    fileprivate init<U: ConstraintOperand>(original: T, other: U) {
        self.original = original
        self.priority = other.priority
        self.multiplier = other.multiplier
        self.constant = other.constant
    }

    public func constant(for attribute: NSLayoutConstraint.Attribute) -> CGFloat? {
        constant(attribute)
    }
    
}

precedencegroup ConstraintModifierPrecedenceGroup {
    higherThan: MultiplicationPrecedence
    lowerThan: BitwiseShiftPrecedence
    associativity: left
    assignment: false
}
infix operator ~ : ConstraintModifierPrecedenceGroup

public func ~ <T>(lhs: T, mutation: ConstraintOperandMutation<T>) -> ModifiedConstraintOperand<T> {
    return mutation.mutating(lhs)
}

public func ~ <T>(lhs: ModifiedConstraintOperand<T>, mutation: ConstraintOperandMutation<T>) -> ModifiedConstraintOperand<T> {
    return mutation.mutating(lhs)
}

internal func ~ <T: ModifiableConstraintOperand, U: ConstraintOperand>(lhs: T, rhs: U) -> ModifiedConstraintOperand<T> {
    return ModifiedConstraintOperand(original: lhs, other: rhs)
}

internal func ~ <T: ModifiableConstraintOperand, U: ConstraintOperand>(lhs: T?, rhs: U) -> ModifiedConstraintOperand<T>? {
    guard let lhs = lhs else { return nil }
    return ModifiedConstraintOperand(original: lhs, other: rhs)
}

public struct ConstraintOperandMutation<T: ModifiableConstraintOperand> {
    fileprivate let mutation: (ModifiedConstraintOperand<T>, inout ModifiedConstraintOperand<T>) -> Void
    
    fileprivate func mutating(_ value: T) -> ModifiedConstraintOperand<T> {
        return mutating(ModifiedConstraintOperand(original: value))
    }
    
    fileprivate func mutating(_ value: ModifiedConstraintOperand<T>) -> ModifiedConstraintOperand<T> {
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
    public static func offset<I: BinaryInteger>(by integer: I) -> ConstraintOperandMutation<T> {
        return ConstraintOperandMutation<T> { old, new in
            new.constant = { attribute in
                return CGFloat(integer) + (old.constant(attribute) ?? 0)
            }
        }
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
    public static func inset<I: BinaryInteger>(by integer: I) -> ConstraintOperandMutation<T> {
        let value = CGFloat(integer)
        return inset(by: UIEdgeInsets(top: value, left: value, bottom: value, right: value))
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
