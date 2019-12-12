//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    @discardableResult
    public func insertSubview<T: UIView>(_ view: T, at index: Int, layout: (Anchors<T>) -> Void) -> Layout {
        insertSubview(view, at: index)
        return Layout.activate { layout(view.anchors) }
    }

    @discardableResult
    public func insertSubview<T: UIView>(_ view: T, belowSubview siblingSubview: UIView, layout: (Anchors<T>) -> Void) -> Layout {
        insertSubview(view, belowSubview: siblingSubview)
        return Layout.activate { layout(view.anchors) }
    }

    @discardableResult
    public func insertSubview<T: UIView>(_ view: T, aboveSubview siblingSubview: UIView, layout: (Anchors<T>) -> Void) -> Layout {
        insertSubview(view, aboveSubview: siblingSubview)
        return Layout.activate { layout(view.anchors) }
    }

    @discardableResult
    public func addSubview<T: UIView>(_ view: T, layout: (Anchors<T>) -> Void) -> Layout {
        addSubview(view)
        return Layout.activate { layout(view.anchors) }
    }
    
    public func addSubviews(_ view1: UIView, _ view2: UIView, _ otherViews: UIView...) {
        addSubview(view1)
        addSubview(view2)
        otherViews.forEach(addSubview)
    }

    public func addSubviews(_ views: [UIView]) {
        views.forEach(addSubview)
    }

    @discardableResult
    public func addSubviews(_ view1: UIView, _ view2: UIView, _ otherViews: UIView..., layout: ([UIView]) -> Void) -> Layout {
        addSubview(view1)
        addSubview(view2)
        otherViews.forEach(addSubview)
        return Layout.activate { layout([view1, view2] + otherViews) }
    }

    @discardableResult
    public func addSubviews(_ views: [UIView], layout: ([UIView]) -> Void) -> Layout {
        views.forEach(addSubview)
        return Layout.activate { layout(views) }
    }

    @discardableResult
    public func addLayoutGuide<T: UILayoutGuide>(_ layoutGuide: T, layout: (Anchors<T>) -> Void) -> Layout {
        addLayoutGuide(layoutGuide)
        return Layout.activate { layout(layoutGuide.anchors) }
    }
    
    public func addLayoutGuides(_ layoutGuide1: UILayoutGuide, _ layoutGuide2: UILayoutGuide, _ otherLayoutGuides: UILayoutGuide...) {
        addLayoutGuide(layoutGuide1)
        addLayoutGuide(layoutGuide2)
        otherLayoutGuides.forEach(addLayoutGuide)
    }

    public func addLayoutGuides(_ layoutGuides: [UILayoutGuide]) {
        layoutGuides.forEach(addLayoutGuide)
    }

    @discardableResult
    public func addLayoutGuides(_ layoutGuide1: UILayoutGuide, _ layoutGuide2: UILayoutGuide, _ otherLayoutGuides: UILayoutGuide..., layout: ([UILayoutGuide]) -> Void) -> Layout {
        addLayoutGuide(layoutGuide1)
        addLayoutGuide(layoutGuide2)
        otherLayoutGuides.forEach(addLayoutGuide)
        return Layout.activate { layout([layoutGuide1, layoutGuide2] + otherLayoutGuides) }
    }

    @discardableResult
    public func addLayoutGuides(_ layoutGuides: [UILayoutGuide], layout: ([UILayoutGuide]) -> Void) -> Layout {
        layoutGuides.forEach(addLayoutGuide)
        return Layout.activate { layout(layoutGuides) }
    }

}
