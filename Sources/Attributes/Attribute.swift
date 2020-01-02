//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public protocol AttributeAxis { }
public enum XAxis: AttributeAxis { }
public enum YAxis: AttributeAxis { }

public protocol AttributeKind {
    associatedtype ValueKind
    var rawValue: NSLayoutConstraint.Attribute { get }
}
public enum PositionValueKind { }
public enum DimensionValueKind { }

public enum Coordinate: AttributeKind {
    public typealias ValueKind = PositionValueKind
    case centerX, centerY
    public var rawValue: NSLayoutConstraint.Attribute {
        switch self {
        case .centerX:
            return .centerX
        case .centerY:
            return .centerY
        }
    }
}

public enum CoordinateWithinMargins: AttributeKind {
    public typealias ValueKind = PositionValueKind
    case centerXWithinMargins, centerYWithinMargins
    public var rawValue: NSLayoutConstraint.Attribute {
        switch self {
        case .centerXWithinMargins:
            return .centerXWithinMargins
        case .centerYWithinMargins:
            return .centerYWithinMargins
        }
    }
}

public enum Edge: AttributeKind {
    public typealias ValueKind = PositionValueKind
    case top, left, leading, trailing, right, bottom
    public var rawValue: NSLayoutConstraint.Attribute {
        switch self {
        case .top:
            return .top
        case .left:
            return .left
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        case .right:
            return .right
        case .bottom:
            return .bottom
        }
    }
}

public enum EdgeMargin: AttributeKind {
    public typealias ValueKind = PositionValueKind
    case topMargin, leftMargin, leadingMargin, trailingMargin, rightMargin, bottomMargin
    public var rawValue: NSLayoutConstraint.Attribute {
        switch self {
        case .topMargin:
            return .topMargin
        case .leftMargin:
            return .leftMargin
        case .leadingMargin:
            return .leadingMargin
        case .trailingMargin:
            return .trailingMargin
        case .rightMargin:
            return .rightMargin
        case .bottomMargin:
            return .bottomMargin
        }
    }
}

public enum Baseline: AttributeKind {
    public typealias ValueKind = PositionValueKind
    case first, last
    public var rawValue: NSLayoutConstraint.Attribute {
        switch self {
        case .first:
            return .firstBaseline
        case .last:
            return .lastBaseline
        }
    }
}

public enum Dimension: AttributeKind {
    public typealias ValueKind = DimensionValueKind
    case width, height
    public var rawValue: NSLayoutConstraint.Attribute {
        switch self {
        case .width:
            return .width
        case .height:
            return .height
        }
    }
}

public protocol Attribute {
    associatedtype Kind: AttributeKind
    associatedtype Axis: AttributeAxis
    static var kind: Kind { get }
    static var rawValue: NSLayoutConstraint.Attribute { get }
}

extension Attribute {
    public static var rawValue: NSLayoutConstraint.Attribute {
        return kind.rawValue
    }
}
