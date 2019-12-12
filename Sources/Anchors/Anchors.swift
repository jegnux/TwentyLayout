//
//  Created by Jérôme Alves on 06/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public struct Anchors<Base: Constrainable> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

extension Constrainable {
    public var anchors: Anchors<Self> {
        Anchors(self)
    }
}

