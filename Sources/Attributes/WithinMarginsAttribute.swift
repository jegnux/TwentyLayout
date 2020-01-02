//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public struct WithinMargins<T>: Attribute where T: Attribute, T.Kind == Coordinate {
    
    public typealias Axis = T.Axis
    
    public static var kind: CoordinateWithinMargins {
        switch T.kind {
        case .centerX:
            return .centerXWithinMargins
        case .centerY:
            return .centerYWithinMargins
        }
    }
    
}
