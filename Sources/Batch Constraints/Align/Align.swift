//
//  Align.swift
//  TwentyLayout-iOS
//
//  Created by Jérôme Alves on 19/01/2020.
//  Copyright © 2020 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public struct Alignment: OptionSet {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let top = Alignment(rawValue: 1 << 0)
    public static let bottom = Alignment(rawValue: 1 << 1)
    public static let left = Alignment(rawValue: 1 << 2)
    public static let right = Alignment(rawValue: 1 << 3)
    public static let leading = Alignment(rawValue: 1 << 4)
    public static let trailing = Alignment(rawValue: 1 << 5)

    public static let topMargin = Alignment(rawValue: 1 << 10)
    public static let bottomMargin = Alignment(rawValue: 1 << 11)
    public static let leftMargin = Alignment(rawValue: 1 << 12)
    public static let rightMargin = Alignment(rawValue: 1 << 13)
    public static let leadingMargin = Alignment(rawValue: 1 << 14)
    public static let trailingMargin = Alignment(rawValue: 1 << 15)

    internal var attributes: [NSLayoutConstraint.Attribute] {
        return [
            contains(.top) ? .top : nil,
            contains(.bottom) ? .bottom : nil,
            contains(.left) ? .left : nil,
            contains(.right) ? .right : nil,
            contains(.leading) ? .leading : nil,
            contains(.trailing) ? .trailing : nil,
            contains(.topMargin) ? .topMargin : nil,
            contains(.bottomMargin) ? .bottomMargin : nil,
            contains(.leftMargin) ? .leftMargin : nil,
            contains(.rightMargin) ? .rightMargin : nil,
            contains(.leadingMargin) ? .leadingMargin : nil,
            contains(.trailingMargin) ? .trailingMargin : nil,
            ].compactMap({ $0 })
    }
}

extension Layout {
    
    static func align(_ items: [AlignableItem], on alignment: Alignment, priority: UILayoutPriority? = nil) {
        let items = items.filter { $0 is ReallyAlignableItem }
        guard items.count > 1 else {
            return
        }
        for (lhs, rhs) in zip(items, items.dropFirst()) {
            for attribute in alignment.attributes {
                Layout.push(Constraint(lhs, attribute, .equal, rhs, attribute, priority: priority))
            }
        }
    }
}

public protocol AlignableItem: AnyObject {}
internal protocol ReallyAlignableItem: AlignableItem {}

extension UIView: ReallyAlignableItem {}
extension UILayoutGuide: ReallyAlignableItem {}
