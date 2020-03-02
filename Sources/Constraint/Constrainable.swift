//
//  Created by Jérôme Alves on 06/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

public protocol Constrainable: AnyObject, Hashable, ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {}
public protocol FrameConstrainable: Constrainable {}
public protocol BaselineConstrainable: Constrainable {}

extension UIView: FrameConstrainable, BaselineConstrainable {
    public var constraintValue: UIView {
        return self
    }
}

extension UILayoutGuide: FrameConstrainable {
    public var constraintValue: UILayoutGuide {
        return self
    }
}
