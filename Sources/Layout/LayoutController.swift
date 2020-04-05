//
//  Created by Jérôme Alves on 07/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

@propertyWrapper
public final class LayoutController {
    
    public init(wrappedValue: Layout? = nil) {
        self.wrappedValue = wrappedValue
    }
        
    public var wrappedValue: Layout? {
        didSet {
            Layout.update(from: oldValue, to: wrappedValue)
        }
    }
}
