//
//  FirstCommonAncestor.swift
//  TwentyLayout-iOS
//
//  Created by Jérôme Alves on 08/03/2020.
//  Copyright © 2020 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    internal static func firstCommonAncestor(between lhs: AnyObject?, and rhs: AnyObject?) -> UIView? {
        firstCommonAncestor(of: [lhs, rhs])
    }

    internal static func firstCommonAncestor(of objects: [AnyObject?]) -> UIView? {
        let stacks = objects.compactMap(ancestor).map { view in
            sequence(first: view, next: { $0.superview }).reversed()
        }

        guard let minCount = stacks.min(by: { $0.count < $1.count })?.count else {
            return nil
        }
        
        for i in (0 ..< minCount).reversed() {
            let views = Set(stacks.map({ $0[i] }))
            if views.count == 1 {
                return views.first
            }
        }
        return nil
    }
}

private func ancestor(of object: AnyObject?) -> UIView? {
    if let view = object as? UIView {
        return view
    }
    if let layoutGuide = object as? UILayoutGuide {
        return layoutGuide.owningView
    }
    return nil
}
