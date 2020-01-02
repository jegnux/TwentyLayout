//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public struct Top: Attribute {
    public typealias Axis = YAxis
    public static let kind: Edge = .top
}

public struct Left: Attribute {
    public typealias Axis = XAxis
    public static let kind: Edge = .left
}

public struct Leading: Attribute {
    public typealias Axis = XAxis
    public static let kind: Edge = .leading
}

public struct Trailing: Attribute {
    public typealias Axis = XAxis
    public static let kind: Edge = .trailing
}

public struct Right: Attribute {
    public typealias Axis = XAxis
    public static let kind: Edge = .right
}

public struct Bottom: Attribute {
    public typealias Axis = YAxis
    public static let kind: Edge = .bottom
}

public struct CenterX: Attribute {
    public typealias Axis = XAxis
    public static let kind: Coordinate = .centerX
}

public struct CenterY: Attribute {
    public typealias Axis = YAxis
    public static let kind: Coordinate = .centerY
}

public struct Width: Attribute {
    public typealias Axis = XAxis
    public static let kind: Dimension = .width
}

public struct Height: Attribute {
    public typealias Axis = YAxis
    public static let kind: Dimension = .height
}

public struct FirstBaseline: Attribute {
    public typealias Axis = YAxis
    public static let kind: Baseline = .first
}

public struct LastBaseline: Attribute {
    public typealias Axis = YAxis
    public static let kind: Baseline = .last
}

public typealias TopMargin = Margin<Top>
public typealias LeftMargin = Margin<Left>
public typealias LeadingMargin = Margin<Leading>
public typealias TrailingMargin = Margin<Trailing>
public typealias RightMargin = Margin<Right>
public typealias BottomMargin = Margin<Bottom>

public typealias CenterXWithinMargins = WithinMargins<CenterX>
public typealias CenterYWithinMargins = WithinMargins<CenterY>

