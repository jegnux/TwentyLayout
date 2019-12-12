//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public struct WithinMargins<T>: Attribute where T: Attribute, T.Kind == Coordinate {
    public typealias Kind = T.Kind
    public typealias Axis = T.Axis
    public init() {}
    public var rawValue: NSLayoutConstraint.Attribute {
        switch T.init().rawValue {
        case .centerX, .centerXWithinMargins: return .centerXWithinMargins
        case .centerY, .centerYWithinMargins: return .centerYWithinMargins
        default: fatalError()
        }
    }
}
