//
//  Created by Jérôme Alves on 06/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

private protocol RelationMaker {
    var leadingRelation: NSLayoutConstraint.Relation? { get }
    var centerXRelation: NSLayoutConstraint.Relation? { get }
    var trailingRelation: NSLayoutConstraint.Relation? { get }
    var topRelation: NSLayoutConstraint.Relation? { get }
    var centerYRelation: NSLayoutConstraint.Relation? { get }
    var bottomRelation: NSLayoutConstraint.Relation? { get }
}

public protocol StackAlignment {
    static var random: Self { get }
    static var `default`: Self { get }
}

extension RelationMaker {
    fileprivate var leadingRelation: NSLayoutConstraint.Relation? { return nil }
    fileprivate var centerXRelation: NSLayoutConstraint.Relation? { return nil }
    fileprivate var trailingRelation: NSLayoutConstraint.Relation? { return nil }
    fileprivate var topRelation: NSLayoutConstraint.Relation? { return nil }
    fileprivate var centerYRelation: NSLayoutConstraint.Relation? { return nil }
    fileprivate var bottomRelation: NSLayoutConstraint.Relation? { return nil }
}


public enum HStackAlignment: StackAlignment, CaseIterable {
    case fill, top, centerY, bottom
    public static var random: HStackAlignment {
        return allCases.randomElement()!
    }
    public static var `default`: HStackAlignment {
        return .fill
    }
}

public enum VStackAlignment: StackAlignment, CaseIterable {
    case fill, leading, centerX, trailing
    public static var random: VStackAlignment {
        return allCases.randomElement()!
    }
    public static var `default`: VStackAlignment {
        return .fill
    }
}

public struct StackAxis<Alignment: StackAlignment> {
    private init() { }
    public static var horizontal: StackAxis<HStackAlignment> {
        return StackAxis<HStackAlignment>()
    }
    public static var vertical: StackAxis<VStackAlignment> {
        return StackAxis<VStackAlignment>()
    }
}

public protocol StackItem {
    var view: UIView? { get }
    var visibility: StackItemVisibility { get }
    var customSpacing: CGFloat? { get }
}

extension StackItem {
    public var visibility: StackItemVisibility { .visible }
    public var customSpacing: CGFloat? { nil }
}

public struct FlexibleSpace: StackItem {
    public var view: UIView? { nil }
    public init() { }
    public static let flexibleSpace = FlexibleSpace()
}

public struct CustomSpacing: StackItem {
    public var view: UIView? { nil }
    let value: CGFloat
    public init(_ value: CGFloat) {
        self.value = value
    }
    public var customSpacing: CGFloat? {
        return value
    }
}

public enum StackItemVisibility: CaseIterable {
    case visible, hidden
    public static var random: StackItemVisibility {
        allCases.randomElement()!
    }
}

public struct ModifiedStackItemView: StackItem {
    public var view: UIView? { _view }

    internal let _view: UIView
    public var visibility: StackItemVisibility
    init(view: UIView, visibility: StackItemVisibility) {
        _view = view
        self.visibility = visibility
    }
}

extension UIView: StackItem {
    public var view: UIView? { self }
    
    public func visibility(_ visibility: StackItemVisibility) -> ModifiedStackItemView {
        alpha = visibility == .hidden ? 0 : 1
        return ModifiedStackItemView(view: self, visibility: visibility)
    }
    
    public func isVisible(_ isVisible: Bool) -> ModifiedStackItemView {
        return visibility(isVisible ? .visible : .hidden)
    }
    
    public func isHidden(_ isHidden: Bool) -> ModifiedStackItemView {
        return visibility(isHidden ? .hidden : .visible)
    }

}

extension Layout {
    
    public static func HStack(
        bounds: UILayoutGuide? = nil,
        alignment: HStackAlignment = .default,
        spacing: CGFloat = 0,
        layoutMargins: UIEdgeInsets = .zero,
        content items: [StackItem?]
    ) {
        stack(axis: .horizontal, bounds: bounds, alignment: alignment, spacing: spacing, layoutMargins: layoutMargins, content: items)
    }
    
    public static func VStack(
        bounds: UILayoutGuide? = nil,
        alignment: VStackAlignment = .default,
        spacing: CGFloat = 0,
        layoutMargins: UIEdgeInsets = .zero,
        content items: [StackItem?]
    ) {
        stack(axis: .vertical, bounds: bounds, alignment: alignment, spacing: spacing, layoutMargins: layoutMargins, content: items)
    }

    public static func stack<Alignment>(
        axis: StackAxis<Alignment>,
        bounds: UILayoutGuide? = nil,
        alignment: Alignment = .default,
        spacing: CGFloat = 0,
        layoutMargins: UIEdgeInsets = .zero,
        content items: [StackItem?]
    ) {
        guard let relations = alignment as? RelationMaker else {
            fatalError("You should not use custom StackAxis / StackAlignment")
        }
        let items: [StackItem] = items
            .compactMap { $0 }
            .enumerated()
            .filter { i, item in
                (i != 0 && i != items.count - 1) || item.view != nil
            }
            .map { $0.element }
        
        if let bounds = bounds {
            if let first = items.first?.view {
                Layout.push(
                    first.anchors.top,
                    alignment is VStackAlignment ? .equal : nil,
                    bounds.anchors.top
                        //&& offset(by: layoutMargins.top)
                )
                Layout.push(
                    first.anchors.leading,
                    alignment is HStackAlignment ? .equal : nil,
                    bounds.anchors.leading
                        //&& offset(by: layoutMargins.left)
                )
            }
            if let last = items.last?.view {
                Layout.push(
                    last.anchors.bottom,
                    alignment is VStackAlignment ? .equal : nil,
                    bounds.anchors.bottom
                        //&& offset(by: layoutMargins.bottom)
                )
                Layout.push(
                    last.anchors.trailing,
                    alignment is HStackAlignment ? .equal : nil,
                    bounds.anchors.trailing
                        //&& offset(by: layoutMargins.right)
                )
            }
        }
        
        for item in items {
            guard let view = item.view else { continue }
            if let bounds = bounds {
                Layout.push(
                    view.anchors.top,
                    relations.topRelation,
                    bounds.anchors.top
                        //&& .offset(by: layoutMargins.top)
                )
                Layout.push(
                    view.anchors.centerY,
                    relations.centerYRelation,
                    bounds.anchors.centerY
                )
                Layout.push(
                    view.anchors.bottom,
                    relations.bottomRelation,
                    bounds.anchors.bottom
                        //&& .offset(by: layoutMargins.bottom)
                )

                Layout.push(
                    view.anchors.leading,
                    relations.leadingRelation,
                    bounds.anchors.leading
                        //&& .offset(by: layoutMargins.left)
                )
                Layout.push(
                    view.anchors.centerX,
                    relations.centerXRelation,
                    bounds.anchors.centerX
                )
                Layout.push(
                    view.anchors.trailing,
                    relations.trailingRelation,
                    bounds.anchors.trailing
                        //&& .offset(by: layoutMargins.right)
                )
            }
        }
        
        if items.count > 1 {
            var previous: UIView!
            for (x, y) in zip(items, items.dropFirst()) {
                if x.visibility == .visible, let view = x.view {
                    previous = view
                } else if previous == nil {
                    continue
                }
                guard let current = y.view else {
                    continue
                }
                let spacing = x.customSpacing ?? spacing
                
                if x is FlexibleSpace {
                    if alignment is VStackAlignment {
                    current.anchors.top >=  previous.anchors.bottom
                        //&& offset(by: spacing)
                    
                    current.anchors.top == previous.anchors.bottom
                        //&& offset(by: spacing)
                        //&& priority(.fittingSizeLevel)
                    } else if alignment is HStackAlignment {
                        current.anchors.leading >=  previous.anchors.trailing
                            //&& offset(by: spacing)
                        
                        current.anchors.leading == previous.anchors.trailing
                            //&& offset(by: spacing)
                            //&& priority(.fittingSizeLevel)
                    }
                } else {
                    if alignment is VStackAlignment {
                        current.anchors.top == previous.anchors.bottom
                            //&& offset(by: spacing)
                    }else if alignment is HStackAlignment {
                        current.anchors.leading == previous.anchors.trailing
                            //&& offset(by: spacing)
                    }
                }
                
                if bounds == nil {
                    Layout.push(
                        current.anchors.top,
                        relations.topRelation?.strict,
                        previous.anchors.top
                        //&& offset(by: layoutMargins.top)
                    )
                    Layout.push(
                        current.anchors.centerY,
                        relations.centerYRelation?.strict,
                        previous.anchors.centerY
                    )
                    Layout.push(
                        current.anchors.bottom,
                        relations.bottomRelation?.strict,
                        previous.anchors.bottom
                        //&& offset(by: layoutMargins.bottom)
                    )

                    Layout.push(
                        current.anchors.leading,
                        relations.leadingRelation?.strict,
                        previous.anchors.leading
                        //&& offset(by: layoutMargins.left)
                    )
                    Layout.push(
                        current.anchors.centerX,
                        relations.centerXRelation?.strict,
                        previous.anchors.centerX
                    )
                    Layout.push(
                        current.anchors.trailing,
                        relations.trailingRelation?.strict,
                        previous.anchors.trailing
                        //&& offset(by: layoutMargins.right)
                    )
                }
            }
        }
    }
}

extension VStackAlignment: RelationMaker {
    fileprivate var leadingRelation: NSLayoutConstraint.Relation? {
        switch self {
        case .fill: return .equal
        case .leading: return .equal
        case .centerX: return .greaterThanOrEqual
        case .trailing: return .greaterThanOrEqual
        }
    }

    fileprivate var centerXRelation: NSLayoutConstraint.Relation? {
        switch self {
        case .fill: return nil
        case .leading: return nil
        case .centerX: return .equal
        case .trailing: return nil
        }
    }

    fileprivate var trailingRelation: NSLayoutConstraint.Relation? {
        switch self {
        case .fill: return .equal
        case .leading: return .lessThanOrEqual
        case .centerX: return .lessThanOrEqual
        case .trailing: return .equal
        }
    }
}

extension HStackAlignment: RelationMaker {
    fileprivate var topRelation: NSLayoutConstraint.Relation? {
        switch self {
        case .fill: return .equal
        case .top: return .equal
        case .centerY: return .greaterThanOrEqual
        case .bottom: return .greaterThanOrEqual
        }
    }

    fileprivate var centerYRelation: NSLayoutConstraint.Relation? {
        switch self {
        case .fill: return nil
        case .top: return nil
        case .centerY: return .equal
        case .bottom: return nil
        }
    }

    fileprivate var bottomRelation: NSLayoutConstraint.Relation? {
        switch self {
        case .fill: return .equal
        case .top: return .lessThanOrEqual
        case .centerY: return .lessThanOrEqual
        case .bottom: return .equal
        }
    }
}

extension NSLayoutConstraint.Relation {
    fileprivate var strict: NSLayoutConstraint.Relation? {
        return self == .equal ? .equal : nil
    }
}
