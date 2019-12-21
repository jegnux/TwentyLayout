//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public struct Margin<T>: Attribute where T: Attribute, T.Kind == Edge {
    public typealias Kind = T.Kind
    public typealias Axis = T.Axis
    public init() { }
    public var rawValue: NSLayoutConstraint.Attribute {
        switch T.init().rawValue {
        case .left, .leftMargin: return .leftMargin
        case .right, .rightMargin: return .rightMargin
        case .top, .topMargin: return .topMargin
        case .bottom, .bottomMargin: return .bottomMargin
        case .leading, .leadingMargin: return .leadingMargin
        case .trailing, .trailingMargin: return .trailingMargin
        default: fatalError("Margin shouldn't be applied on any other attribute")
        }
    }
}

