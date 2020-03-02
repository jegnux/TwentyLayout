//
//  ConstraintOperand+Primitives.swift
//  TwentyLayout-iOS
//
//  Created by Jérôme Alves on 14/01/2020.
//  Copyright © 2020 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

extension Int: ModifiableConstraintOperand, SingleAnchorPrimitive {
    public var constraintValue: Int {
        return self
    }
    public func constant(for attribute: NSLayoutConstraint.Attribute) -> CGFloat? {
        return CGFloat(self)
    }
}
extension Float: ModifiableConstraintOperand, SingleAnchorPrimitive {
    public var constraintValue: Float {
        return self
    }
    public func constant(for attribute: NSLayoutConstraint.Attribute) -> CGFloat? {
        return CGFloat(self)
    }
}
extension Double: ModifiableConstraintOperand, SingleAnchorPrimitive {
    public var constraintValue: Double {
        return self
    }
    public func constant(for attribute: NSLayoutConstraint.Attribute) -> CGFloat? {
        return CGFloat(self)
    }
}
extension CGFloat: ModifiableConstraintOperand, SingleAnchorPrimitive {
    public var constraintValue: CGFloat {
        return self
    }
    public func constant(for attribute: NSLayoutConstraint.Attribute) -> CGFloat? {
        return self
    }
}

extension CGPoint: ModifiableConstraintOperand {
    public var constraintValue: CGPoint {
        return self
    }
    public func constant(for attribute: NSLayoutConstraint.Attribute) -> CGFloat? {
        switch attribute {
        case .top, .topMargin,
             .centerY, .centerYWithinMargins,
             .bottom, .bottomMargin,
             .firstBaseline, .lastBaseline:
            return y
        case .left, .leftMargin,
             .leading, .leadingMargin,
             .centerX, .centerXWithinMargins,
             .trailing, .trailingMargin,
             .right, .rightMargin:
            return x
        default: return nil
        }
    }
}

extension CGSize: ModifiableConstraintOperand {
    public var constraintValue: CGSize {
        return self
    }
    public func constant(for attribute: NSLayoutConstraint.Attribute) -> CGFloat? {
        switch attribute {
        case .width: return width
        case .height: return height
        default: return nil
        }
    }
}

extension UIEdgeInsets {
    internal func inset(for attribute: NSLayoutConstraint.Attribute) -> CGFloat? {
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
    
    internal func offset(for attribute: NSLayoutConstraint.Attribute) -> CGFloat? {
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
