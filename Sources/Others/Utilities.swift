//
//  Created by Jérôme Alves on 06/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation

internal func pointer<T: AnyObject>(of value: T) -> String {
    String(format: "%p", unsafeBitCast(value, to: Int.self))
}

internal func rawDescription(of value: Any) -> String {
    String(describing: type(of: value))
}

internal func rawDescription(of value: AnyObject) -> String {
    "\(type(of: value))<\(pointer(of: value))>"
}
