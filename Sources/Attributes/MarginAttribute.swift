//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public struct Margin<T>: Attribute where T: Attribute, T.Kind == Edge {

    public typealias Axis = T.Axis
    
    public static var kind: EdgeMargin {
        switch T.kind {
        case .top:
            return .topMargin
        case .left:
            return .leftMargin
        case .leading:
            return .leadingMargin
        case .trailing:
            return .trailingMargin
        case .right:
            return .rightMargin
        case .bottom:
            return .bottomMargin
        }
    }
    
}

