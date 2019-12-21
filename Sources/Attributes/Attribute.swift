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
}
public enum PositionValueKind { }
public enum DimensionValueKind { }

public enum Coordinate: AttributeKind {
    public typealias ValueKind = PositionValueKind
}

public enum Edge: AttributeKind {
    public typealias ValueKind = PositionValueKind
}

public enum Baseline: AttributeKind {
    public typealias ValueKind = PositionValueKind
}

public enum Dimension: AttributeKind {
    public typealias ValueKind = DimensionValueKind
}

public protocol Attribute {
    associatedtype Kind: AttributeKind
    associatedtype Axis: AttributeAxis
    init()
    var rawValue: NSLayoutConstraint.Attribute { get }
}
