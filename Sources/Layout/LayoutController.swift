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
            switch (oldValue, wrappedValue) {
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
                between: oldValue?.firstCommonAncestor,
                and: wrappedValue?.firstCommonAncestor
            )
            if UIView.inheritedAnimationDuration > 0, let animatableView = firstCommonAncestor {
                print("Animatable View:", animatableView)
                animatableView.layoutIfNeeded()
            }
            if let new = wrappedValue {
                print(new)
            }
        }
    }
}
