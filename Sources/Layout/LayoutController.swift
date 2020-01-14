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

extension Layout {
    
    public static func update(from oldLayout: Layout?, to newLayout: Layout?) {
        switch (oldLayout, newLayout) {
        case (let old?, nil):
            old.deactivate()
        case (let old?, let new?):
            old.deactivate()
            new.activate()
        case (nil, let new?):
            new.activate()
        case (nil, nil):
            break
        }
        let firstCommonAncestor = UIView.firstCommonAncestor(
            between: oldLayout?.firstCommonAncestor,
            and: newLayout?.firstCommonAncestor
        )
        if UIView.inheritedAnimationDuration > 0, let animatableView = firstCommonAncestor {
            animatableView.layoutIfNeeded()
        }
    }
    
    @discardableResult
    public static func update(from oldLayout: Layout?, to makeNewLayout: () -> Void) -> Layout {
        let newLayout = Layout(makeNewLayout)
        Layout.update(from: oldLayout, to: newLayout)
        return newLayout
    }

    @discardableResult
    public func update(to newLayout: Layout) -> Layout {
        Layout.update(from: self, to: newLayout)
        return newLayout
    }

    @discardableResult
    public func update(to newLayout: Layout?) -> Layout? {
        Layout.update(from: self, to: newLayout)
        return newLayout
    }
    
    @discardableResult
    public func update(to makeNewLayout: () -> Void) -> Layout {
        let newLayout = Layout(makeNewLayout)
        Layout.update(from: self, to: newLayout)
        return newLayout
    }

}
