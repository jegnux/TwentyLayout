//
//  Created by Jérôme Alves on 06/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public struct ConstraintProperties: Hashable, CustomStringConvertible {
    public fileprivate(set) var multiplier: CGFloat?
    public fileprivate(set) var constant: CGFloat?
    public fileprivate(set) var priority: UILayoutPriority?
    
    public var description: String {
        var result: [String] = []
        if let multiplier = multiplier {
            result.append("x\(multiplier)")
        }
        if let constant = constant {
            result.append("+\(constant)")
        }
        if let priority = priority {
            result.append("@\(priority.rawValue)")
        }
        return result.joined(separator: " ")
    }
}

public protocol ConstraintModifier {
    var constraintProperties: ConstraintProperties { get set }
}

extension ConstraintModifier {
    public func offset(by value: CGFloat) -> Self {
        guard value != 0 else { return self }
        var new = self
        new.constraintProperties.constant = value
        return new
    }

    public func multiplied(by value: CGFloat) -> Self {
        guard value != 1 else { return self }
        var new = self
        new.constraintProperties.multiplier = value
        return new
    }

    public func priority(_ value: UILayoutPriority) -> Self {
        var new = self
        new.constraintProperties.priority = value
        return new
    }
}

public struct ModifiableConstraintItem<Base: Constrainable>: ConstraintModifier {
    public let item: Base
    public var constraintProperties = ConstraintProperties()
    
    public init(_ item: Base) {
        self.item = item
    }
}

extension Constrainable {
    
    public func offset(by value: CGFloat) -> ModifiableConstraintItem<Self> {
        ModifiableConstraintItem(self).offset(by: value)
    }

    public func multiplied(by value: CGFloat) -> ModifiableConstraintItem<Self> {
        ModifiableConstraintItem(self).multiplied(by: value)
    }

    public func priority(_ value: UILayoutPriority) -> ModifiableConstraintItem<Self> {
        ModifiableConstraintItem(self).priority(value)
    }
    
}

public struct ModifiableKeyPath<Base: Constrainable, T>: ConstraintModifier {
    public let keyPath: KeyPath<Base, T>
    public var constraintProperties = ConstraintProperties()
    
    public init(_ keyPath: KeyPath<Base, T>) {
        self.keyPath = keyPath
    }
}

public func its<Root: Constrainable, Value>(_ keyPath: KeyPath<Root, Value>) -> ModifiableKeyPath<Root, Value> {
    ModifiableKeyPath(keyPath)
}

extension KeyPath where Root: Constrainable {
    
    public func offset(by value: CGFloat) -> ModifiableKeyPath<Root, Value> {
        ModifiableKeyPath(self).offset(by: value)
    }

    public func multiplied(by value: CGFloat) -> ModifiableKeyPath<Root, Value> {
        ModifiableKeyPath(self).multiplied(by: value)
    }

    public func priority(_ value: UILayoutPriority) -> ModifiableKeyPath<Root, Value> {
        ModifiableKeyPath(self).priority(value)
    }
    
}

public struct ConstraintDimension: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral, Hashable, ConstraintModifier {
    
    public static func random(in range: Range<CGFloat>) -> ConstraintDimension {
        return .raw(.random(in: range))
    }
    
    public static func random(in range: ClosedRange<CGFloat>) -> ConstraintDimension {
        return .raw(.random(in: range))
    }

    public static func raw(_ rawValue: CGFloat) -> ConstraintDimension {
        return ConstraintDimension(rawValue)
    }

    private init(_ rawValue: CGFloat) {
        self.rawValue = rawValue
    }
    
    public init(floatLiteral value: Float) {
        self.rawValue = CGFloat(value)
    }
    
    public init(integerLiteral value: Int) {
        self.rawValue = CGFloat(value)
    }
    
    public var rawValue: CGFloat
            
    public var constraintProperties: ConstraintProperties = ConstraintProperties()
    
}

public protocol ConstraintOperand {
    associatedtype ConstraintAttributeKind: AttributeKind
    associatedtype RawValue: ConstraintOperand
    var rawValue: RawValue { get }
    var priority: UILayoutPriority? { get }
    func constant<Attribute: TwentyLayout.Attribute>(for attribute: Attribute) -> CGFloat? where Attribute.Kind == ConstraintAttributeKind
    
    func priority(_ value: UILayoutPriority) -> ModifiedDimensionConstraintOperand<RawValue>
}

extension ConstraintOperand where Self.RawValue == Self {
    public var rawValue: RawValue {
        return self
    }
    public var priority: UILayoutPriority? {
        return nil
    }
    public func constant<Attribute: TwentyLayout.Attribute>(for attribute: Attribute) -> CGFloat? where Attribute.Kind == ConstraintAttributeKind {
        return nil
    }
    public func priority(_ value: UILayoutPriority) -> ModifiedDimensionConstraintOperand<Self.RawValue> {
        return ModifiedDimensionConstraintOperand(rawValue: self.rawValue).priority(value)
    }
}


extension ConstraintOperand where Self : BinaryInteger {
    public func constant<Attribute: TwentyLayout.Attribute>(for attribute: Attribute) -> CGFloat? where Attribute.Kind == ConstraintAttributeKind {
        return CGFloat(self)
    }
}

extension ConstraintOperand where Self : BinaryFloatingPoint {
    public func constant<Attribute: TwentyLayout.Attribute>(for attribute: Attribute) -> CGFloat? where Attribute.Kind == ConstraintAttributeKind {
        return CGFloat(self)
    }
}

extension UIEdgeInsets: ConstraintOperand {
    public typealias RawValue = UIEdgeInsets
    public typealias ConstraintAttributeKind = Edge
    public func constant<Attribute: TwentyLayout.Attribute>(for attribute: Attribute) -> CGFloat? where Attribute.Kind == ConstraintAttributeKind {
        switch attribute.rawValue {
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
}

public struct ModifiedDimensionConstraintOperand<RawValue: ConstraintOperand>: ConstraintOperand {
    public typealias ConstraintAttributeKind = RawValue.ConstraintAttributeKind
    public private(set) var priority: UILayoutPriority? = nil
    public let rawValue: RawValue
    
    fileprivate init(rawValue: RawValue) {
        self.rawValue = rawValue
    }

    public func constant<Attribute: TwentyLayout.Attribute>(for attribute: Attribute) -> CGFloat? where Attribute.Kind == ConstraintAttributeKind {
        rawValue.constant(for: attribute)
    }
    
    public func priority(_ value: UILayoutPriority) -> ModifiedDimensionConstraintOperand<RawValue> {
        var copy = self
        copy.priority = value
        return copy
    }

}
