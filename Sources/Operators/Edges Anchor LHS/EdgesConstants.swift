//
//  EdgesConstants.swift
//  TwentyLayout-iOS
//
//  Created by Jérôme Alves on 14/01/2020.
//  Copyright © 2020 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public struct EdgesConstants: ModifiableConstraintOperand {
    internal enum Kind {
        case inset, offset
    }
    internal let kind: Kind
    internal let top: CGFloat
    internal let left: CGFloat
    internal let bottom: CGFloat
    internal let right: CGFloat
    
    private init<F: BinaryFloatingPoint>(kind: Kind, top: F, left: F, bottom: F, right: F) {
        self.kind = kind
        self.top = CGFloat(top)
        self.left = CGFloat(left)
        self.bottom = CGFloat(bottom)
        self.right = CGFloat(right)
    }

    private init<I: BinaryInteger>(kind: Kind, top: I, left: I, bottom: I, right: I) {
        self.kind = kind
        self.top = CGFloat(top)
        self.left = CGFloat(left)
        self.bottom = CGFloat(bottom)
        self.right = CGFloat(right)
    }

    public static func inset<I: BinaryInteger>(top: I = 0, left: I = 0, bottom: I = 0, right: I = 0) -> EdgesConstants {
        EdgesConstants(kind: .inset, top: top, left: left, bottom: bottom, right: right)
    }
    
    public static func inset<I: BinaryInteger>(by inset: I) -> EdgesConstants {
        .inset(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    public static func inset<F: BinaryFloatingPoint>(top: F = 0, left: F = 0, bottom: F = 0, right: F = 0) -> EdgesConstants {
        EdgesConstants(kind: .inset, top: top, left: left, bottom: bottom, right: right)
    }
    
    public static func inset<F: BinaryFloatingPoint>(by inset: F) -> EdgesConstants {
        .inset(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    public static func inset(by edgeInsets: UIEdgeInsets) -> EdgesConstants {
        .inset(top: edgeInsets.top, left: edgeInsets.left, bottom: edgeInsets.bottom, right: edgeInsets.right)
    }
    
    @available(iOS 11.0, *)
    public static func inset(by edgeInsets: NSDirectionalEdgeInsets) -> EdgesConstants {
        .inset(top: edgeInsets.top, left: edgeInsets.leading, bottom: edgeInsets.bottom, right: edgeInsets.trailing)
    }

    public static func offset<I: BinaryInteger>(by offset: I) -> EdgesConstants {
        .offset(top: offset, left: offset, bottom: offset, right: offset)
    }
    
    public static func offset<I: BinaryInteger>(top: I = 0, left: I = 0, bottom: I = 0, right: I = 0) -> EdgesConstants {
        EdgesConstants(kind: .offset, top: top, left: left, bottom: bottom, right: right)
    }

    public static func offset<F: BinaryFloatingPoint>(by offset: F) -> EdgesConstants {
        .offset(top: offset, left: offset, bottom: offset, right: offset)
    }
    
    public static func offset<F: BinaryFloatingPoint>(top: F = 0, left: F = 0, bottom: F = 0, right: F = 0) -> EdgesConstants {
        EdgesConstants(kind: .offset, top: top, left: left, bottom: bottom, right: right)
    }

    public static func offset(by edgeInsets: UIEdgeInsets) -> EdgesConstants {
        .offset(top: edgeInsets.top, left: edgeInsets.left, bottom: edgeInsets.bottom, right: edgeInsets.right)
    }

    @available(iOS 11.0, *)
    public static func offset(by edgeInsets: NSDirectionalEdgeInsets) -> EdgesConstants {
        .offset(top: edgeInsets.top, left: edgeInsets.leading, bottom: edgeInsets.bottom, right: edgeInsets.trailing)
    }
    
    public func constant(for attribute: NSLayoutConstraint.Attribute) -> CGFloat? {
        let factor: CGFloat
        switch kind {
        case .inset: factor = -1
        case .offset: factor = 1
        }
        switch attribute {
        case .left, .leading, .leftMargin, .leadingMargin:
            return left
        case .right, .trailing, .rightMargin, .trailingMargin:
            return right * factor
        case .top, .topMargin:
            return top
        case .bottom, .bottomMargin:
            return bottom * factor
        default:
            return nil
        }
    }
}
