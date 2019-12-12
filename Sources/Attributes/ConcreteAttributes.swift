//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public struct Top: Attribute {
    public typealias Kind = Edge
    public typealias Axis = YAxis
    public init() {}
    public var rawValue: NSLayoutConstraint.Attribute { .top }
}

public struct Left: Attribute {
    public typealias Kind = Edge
    public typealias Axis = XAxis
    public init() {}
    public var rawValue: NSLayoutConstraint.Attribute { .left }
}

public struct Leading: Attribute {
    public typealias Kind = Edge
    public typealias Axis = XAxis
    public init() {}
    public var rawValue: NSLayoutConstraint.Attribute { .leading }
}

public struct Trailing: Attribute {
    public typealias Kind = Edge
    public typealias Axis = XAxis
    public init() {}
    public var rawValue: NSLayoutConstraint.Attribute { .trailing }
}

public struct Right: Attribute {
    public typealias Kind = Edge
    public typealias Axis = XAxis
    public init() {}
    public var rawValue: NSLayoutConstraint.Attribute { .right }
}

public struct Bottom: Attribute {
    public typealias Kind = Edge
    public typealias Axis = YAxis
    public init() {}
    public var rawValue: NSLayoutConstraint.Attribute { .bottom }
}

public struct CenterX: Attribute {
    public typealias Kind = Coordinate
    public typealias Axis = XAxis
    public init() {}
    public var rawValue: NSLayoutConstraint.Attribute { .centerX }
}

public struct CenterY: Attribute {
    public typealias Kind = Coordinate
    public typealias Axis = YAxis
    public init() {}
    public var rawValue: NSLayoutConstraint.Attribute { .centerY }
}

public struct Width: Attribute {
    public typealias Kind = Dimension
    public typealias Axis = XAxis
    public init() {}
    public var rawValue: NSLayoutConstraint.Attribute { .width }
}

public struct Height: Attribute {
    public typealias Kind = Dimension
    public typealias Axis = YAxis
    public init() {}
    public var rawValue: NSLayoutConstraint.Attribute { .height }
}

public struct FirstBaseline: Attribute {
    public typealias Kind = Baseline
    public typealias Axis = YAxis
    public init() {}
    public var rawValue: NSLayoutConstraint.Attribute { .firstBaseline }
}

public struct LastBaseline: Attribute {
    public typealias Kind = Baseline
    public typealias Axis = YAxis
    public init() {}
    public var rawValue: NSLayoutConstraint.Attribute { .lastBaseline }
}

public typealias TopMargin = Margin<Top>
public typealias LeftMargin = Margin<Left>
public typealias LeadingMargin = Margin<Leading>
public typealias TrailingMargin = Margin<Trailing>
public typealias RightMargin = Margin<Right>
public typealias BottomMargin = Margin<Bottom>

public typealias CenterXWithinMargins = WithinMargins<CenterX>
public typealias CenterYWithinMargins = WithinMargins<CenterY>

