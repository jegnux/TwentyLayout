//
//  ConstraintOperand+Primitives.swift
//  TwentyLayout-iOS
//
//  Created by Jérôme Alves on 14/01/2020.
//  Copyright © 2020 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

extension Int: ModifiableConstraintOperand, SingleAnchorPrimitive {}
extension Float: ModifiableConstraintOperand, SingleAnchorPrimitive {}
extension Double: ModifiableConstraintOperand, SingleAnchorPrimitive {}
extension CGFloat: ModifiableConstraintOperand, SingleAnchorPrimitive {}

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

extension CGPoint: ModifiableConstraintOperand {
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
