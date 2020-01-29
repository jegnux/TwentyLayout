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

public protocol StackableItem {}
internal protocol ReallyStackableItem {}
internal protocol ConstrainableStackableItem: AnyObject {}

public struct FlexibleSpace: StackableItem, ReallyStackableItem {
    public init() { }
}

public struct CustomSpacing: StackableItem, ReallyStackableItem {
    public let value: CGFloat
    public init(_ value: CGFloat) {
        self.value = value
    }
}

public enum StackItemVisibility: CaseIterable {
    case visible, hidden
    public static var random: StackItemVisibility {
        allCases.randomElement()!
    }
}

extension UIView: StackableItem, ReallyStackableItem, ConstrainableStackableItem {}
extension UILayoutGuide: StackableItem, ReallyStackableItem, ConstrainableStackableItem {}

private enum LayoutAxis {
    case horizontal, vertical
}

extension Layout {
    
    public static func HStack(
        bounds: UILayoutGuide? = nil,
        alignment: HStackAlignment = .default,
        spacing: CGFloat = 0,
        layoutMargins: UIEdgeInsets = .zero,
        content items: [StackableItem?]
    ) {
        stack(axis: .horizontal, bounds: bounds, alignment: alignment, spacing: spacing, layoutMargins: layoutMargins, content: items)
    }
    
    public static func VStack(
        bounds: UILayoutGuide? = nil,
        alignment: VStackAlignment = .default,
        spacing: CGFloat = 0,
        layoutMargins: UIEdgeInsets = .zero,
        content items: [StackableItem?]
    ) {
        stack(axis: .vertical, bounds: bounds, alignment: alignment, spacing: spacing, layoutMargins: layoutMargins, content: items)
    }

    public static func stack<Alignment>(
        axis: StackAxis<Alignment>,
        bounds: UILayoutGuide? = nil,
        alignment: Alignment = .default,
        spacing: CGFloat = 0,
        layoutMargins: UIEdgeInsets = .zero,
        content items: [StackableItem?]
    ) {
        guard let relations = alignment as? RelationMaker else {
            fatalError("You should not use custom StackAxis / StackAlignment")
        }
        let axis: LayoutAxis
        switch alignment {
        case is HStackAlignment:
            axis = .horizontal
        case is VStackAlignment:
            axis = .vertical
        default:
            fatalError("You should not use custom StackAxis / StackAlignment")
        }
        let items: [ReallyStackableItem] = items
            .compactMap { $0 }
            .compactMap { $0 as? ReallyStackableItem }
            .enumerated()
            .filter { i, item in
                (i != 0 && i != items.count - 1) || item is ConstrainableStackableItem
            }
            .map { $0.element }
        
        if let bounds = bounds {
            if let first = items.first as? ConstrainableStackableItem {
                switch axis {
                case .vertical:
                    Layout.push(Constraint(
                        first, .top, .equal, bounds, .top, constant: layoutMargins.top
                    ))
                case .horizontal:
                    Layout.push(Constraint(
                        first, .leading, .equal, bounds, .leading, constant: layoutMargins.left
                    ))
                }
            }
            if let last = items.last as? ConstrainableStackableItem {
                switch axis {
                case .vertical:
                    Layout.push(Constraint(
                        last, .bottom, .equal, bounds, .bottom, constant: -layoutMargins.bottom
                    ))
                case .horizontal:
                    Layout.push(Constraint(
                        last, .trailing, .equal, bounds, .trailing, constant: -layoutMargins.bottom
                    ))
                }
            }
        }
        
        for item in items {
            guard let constrainableItem = item as? ConstrainableStackableItem else { continue }
            if let bounds = bounds {
                Layout.push(Constraint(
                    constrainableItem, .top, relations.topRelation, bounds, .top, constant: layoutMargins.top
                ))
                Layout.push(Constraint(
                    constrainableItem, .centerY, relations.centerYRelation, bounds, .centerY
                ))
                Layout.push(Constraint(
                    constrainableItem, .bottom, relations.bottomRelation, bounds, .bottom, constant: layoutMargins.bottom
                ))
                Layout.push(Constraint(
                    constrainableItem, .leading, relations.leadingRelation, bounds, .leading, constant: layoutMargins.left
                ))
                Layout.push(Constraint(
                    constrainableItem, .centerX, relations.centerXRelation, bounds, .centerX
                ))
                Layout.push(Constraint(
                    constrainableItem, .trailing, relations.trailingRelation, bounds, .trailing, constant: layoutMargins.right
                ))
            }
        }
        
        if items.count > 1 {
            var previous: ConstrainableStackableItem!
            for (x, y) in zip(items, items.dropFirst()) {
                if /*x.visibility == .visible,*/ let item = x as? ConstrainableStackableItem {
                    previous = item
                } else if previous == nil {
                    continue
                }
                guard let current = y as? ConstrainableStackableItem else {
                    continue
                }
                let thisSpacing: CGFloat
                if let customSpacing = x as? CustomSpacing {
                    thisSpacing = customSpacing.value
                } else {
                    thisSpacing = spacing
                }
                
                if x is FlexibleSpace {
                    switch axis {
                    case .vertical:
                        Layout.push(Constraint(
                            current, .top, .greaterThanOrEqual, previous, .bottom, constant: thisSpacing
                        ))
                        Layout.push(Constraint(
                            current, .top, .equal, previous, .bottom, constant: thisSpacing, priority: .fittingSizeLevel
                        ))
                    case .horizontal:
                        Layout.push(Constraint(
                            current, .leading, .greaterThanOrEqual, previous, .trailing, constant: thisSpacing
                        ))
                        Layout.push(Constraint(
                            current, .leading, .equal, previous, .trailing, constant: thisSpacing, priority: .fittingSizeLevel
                        ))
                    }
                } else {
                    switch axis {
                    case .vertical:
                        Layout.push(Constraint(
                            current, .top, .equal, previous, .bottom, constant: thisSpacing
                        ))
                    case .horizontal:
                        Layout.push(Constraint(
                            current, .leading, .equal, previous, .trailing, constant: thisSpacing
                        ))
                    }
                }
                
                if bounds == nil {
                    Layout.push(Constraint(
                        current, .top, relations.topRelation?.strict, previous, .top, constant: layoutMargins.top
                    ))
                    Layout.push(Constraint(
                        current, .centerY, relations.centerYRelation?.strict, previous, .centerY
                    ))
                    Layout.push(Constraint(
                        current, .bottom, relations.bottomRelation?.strict, previous, .bottom, constant: -layoutMargins.bottom
                    ))
                    Layout.push(Constraint(
                        current, .leading, relations.leadingRelation?.strict, previous, .leading, constant: layoutMargins.left
                    ))
                    Layout.push(Constraint(
                        current, .centerX, relations.centerXRelation?.strict, previous, .centerX
                    ))
                    Layout.push(Constraint(
                        current, .trailing, relations.trailingRelation?.strict, previous, .trailing, constant: -layoutMargins.right
                    ))
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
