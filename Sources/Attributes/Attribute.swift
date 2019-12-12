//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public protocol AttributeAxis { }
public enum XAxis: AttributeAxis { }
public enum YAxis: AttributeAxis { }

public protocol AttributeKind { }
public protocol PositionAttributeKind: AttributeKind { }
public protocol DimensionAttributeKind: AttributeKind { }

public enum Coordinate: PositionAttributeKind { }
public enum Edge: PositionAttributeKind { }
public enum Baseline: PositionAttributeKind { }
public enum Dimension: DimensionAttributeKind { }

public protocol Attribute {
    associatedtype Kind: AttributeKind
    associatedtype Axis: AttributeAxis
    init()
    var rawValue: NSLayoutConstraint.Attribute { get }
}
