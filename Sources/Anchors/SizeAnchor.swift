//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public struct SizeAnchor<Base: FrameConstrainable> {
    public let item: Base
    public var constraintAttributes: [NSLayoutConstraint.Attribute] {
        [.width, .height]
    }

    internal init(_ item: Base) {
        self.item = item
    }
}
