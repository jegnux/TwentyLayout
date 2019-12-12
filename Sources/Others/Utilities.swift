//
//  Created by Jérôme Alves on 06/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

internal func pointer<T: AnyObject>(of value: T) -> String {
    String(format: "%p", unsafeBitCast(value, to: Int.self))
}

internal func rawDescription(of value: Any) -> String {
    String(describing: type(of: value))
}

internal func rawDescription(of value: AnyObject) -> String {
    "\(type(of: value))<\(pointer(of: value))>"
}

extension UIView {
    internal static func firstCommonAncestor(between lhs: AnyObject?, and rhs: AnyObject?) -> UIView? {
        let lhsView = lhs as? UIView
        let lhsLayoutGuide = lhs as? UILayoutGuide
        let lhsAncestorOrNil = lhsView?.superview ?? lhsView ?? lhsLayoutGuide?.owningView?.superview ?? lhsLayoutGuide?.owningView
        
        let rhsView = rhs as? UIView
        let rhsLayoutGuide = rhs as? UILayoutGuide
        let rhsAncestorOrNil = rhsView?.superview ?? rhsView ?? rhsLayoutGuide?.owningView?.superview ?? rhsLayoutGuide?.owningView
        
        var ancestor = lhsAncestorOrNil
        guard let rhsAncestor = rhsAncestorOrNil else {
            return ancestor
        }
        if ancestor == nil || ancestor!.isDescendant(of: rhsAncestor) {
            ancestor = rhsAncestor
        }
        return ancestor
    }
}
