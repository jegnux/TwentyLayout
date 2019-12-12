//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

/// label.anchors.size == 80
public func == <LHSBase>(
    lhs: SizeAnchor<LHSBase>,
    rhs: ConstraintDimension
) {
    lhs.item.anchors.width == rhs
    lhs.item.anchors.height == rhs
}

/// label.anchors.size == CGSize(width: 10, height: 20)
public func == <LHSBase>(
    lhs: SizeAnchor<LHSBase>,
    rhs: CGSize
) {
    lhs.item.anchors.width == .raw(rhs.width)
    lhs.item.anchors.height == .raw(rhs.height)
}
