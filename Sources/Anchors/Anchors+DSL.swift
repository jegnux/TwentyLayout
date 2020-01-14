//
//  Created by Jérôme Alves on 07/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation

// MARK: Single Anchor

extension Anchors where Base: FrameConstrainable {
    public var    edges: EdgesAnchor<Base, Top, Bottom, Left, Right> { EdgesAnchor(base) }
    public var  margins: EdgesAnchor<Base, TopMargin, BottomMargin, LeftMargin, RightMargin> { EdgesAnchor(base) }
    
    public var    directionalEdges: EdgesAnchor<Base, Top, Bottom, Leading, Trailing> { EdgesAnchor(base) }
    public var  directionalMargins: EdgesAnchor<Base, TopMargin, BottomMargin, LeadingMargin, TrailingMargin> { EdgesAnchor(base) }

    public var  center: PointAnchor<Base, CenterX, CenterY> { PointAnchor(base) }
    public var  centerWithinMargins: PointAnchor<Base, CenterXWithinMargins, CenterYWithinMargins> { PointAnchor(base) }

    public var    size: SizeAnchor<Base> { SizeAnchor(base) }

    public var      top: SingleAnchor<Base, Top> { SingleAnchor(base)  }
    public var     left: SingleAnchor<Base, Left> { SingleAnchor(base)  }
    public var    right: SingleAnchor<Base, Right> { SingleAnchor(base)  }
    public var   bottom: SingleAnchor<Base, Bottom> { SingleAnchor(base)  }
    public var  leading: SingleAnchor<Base, Leading> { SingleAnchor(base)  }
    public var trailing: SingleAnchor<Base, Trailing> { SingleAnchor(base) }

    public var      topMargin: SingleAnchor<Base, TopMargin> { SingleAnchor(base)  }
    public var     leftMargin: SingleAnchor<Base, LeftMargin> { SingleAnchor(base)  }
    public var    rightMargin: SingleAnchor<Base, RightMargin> { SingleAnchor(base)  }
    public var   bottomMargin: SingleAnchor<Base, BottomMargin> { SingleAnchor(base)  }
    public var  leadingMargin: SingleAnchor<Base, LeadingMargin> { SingleAnchor(base)  }
    public var trailingMargin: SingleAnchor<Base, TrailingMargin> { SingleAnchor(base)  }

    public var centerX: SingleAnchor<Base, CenterX> { SingleAnchor(base)  }
    public var centerY: SingleAnchor<Base, CenterY> { SingleAnchor(base)  }

    public var centerXWithinMargins: SingleAnchor<Base, CenterXWithinMargins> { SingleAnchor(base) }
    public var centerYWithinMargins: SingleAnchor<Base, CenterYWithinMargins> { SingleAnchor(base) }

    public var  width: SingleAnchor<Base, Width> { SingleAnchor(base)  }
    public var height: SingleAnchor<Base, Height> { SingleAnchor(base)  }
}

extension Anchors where Base: BaselineConstrainable {
    public var firstBaseline: SingleAnchor<Base, FirstBaseline> { SingleAnchor(base) }
    public var  lastBaseline: SingleAnchor<Base, LastBaseline> { SingleAnchor(base)  }
}

// MARK: - Coordinate Anchor from XAxis

extension SingleAnchor where Base: FrameConstrainable, Attribute.Kind.ValueKind == PositionValueKind, Attribute.Axis == XAxis {
    public var      top: PointAnchor<Base, Attribute, Top> { PointAnchor(item) }
    public var     left: SetAnchor<Base> { appending(.left) }
    public var    right: SetAnchor<Base> { appending(.right) }
    public var  leading: SetAnchor<Base> { appending(.leading) }
    public var trailing: SetAnchor<Base> { appending(.trailing) }
    public var   bottom: PointAnchor<Base, Attribute, Bottom> { PointAnchor(item) }

    public var      topMargin: PointAnchor<Base, Attribute, TopMargin> { PointAnchor(item) }
    public var     leftMargin: SetAnchor<Base> { appending(.leftMargin) }
    public var    rightMargin: SetAnchor<Base> { appending(.rightMargin) }
    public var  leadingMargin: SetAnchor<Base> { appending(.leadingMargin) }
    public var trailingMargin: SetAnchor<Base> { appending(.trailingMargin) }
    public var   bottomMargin: PointAnchor<Base, Attribute, BottomMargin> { PointAnchor(item) }

    public var centerX: SetAnchor<Base> { appending(.centerX) }
    public var centerY: PointAnchor<Base, Attribute, CenterY> { PointAnchor(item) }
    
    public var centerXWithinMargins: SetAnchor<Base> { appending(.centerXWithinMargins) }
    public var centerYWithinMargins: PointAnchor<Base, Attribute, CenterYWithinMargins> { PointAnchor(item) }
}

extension SingleAnchor where Base: BaselineConstrainable, Attribute.Kind.ValueKind == PositionValueKind, Attribute.Axis == XAxis {
    public var firstBaseline: PointAnchor<Base, Attribute, FirstBaseline> { PointAnchor(item) }
    public var  lastBaseline: PointAnchor<Base, Attribute, LastBaseline> { PointAnchor(item) }
}

// MARK: - Coordinate Anchor from YAxis

extension SingleAnchor where Attribute.Kind.ValueKind == PositionValueKind, Attribute.Axis == YAxis {

    public var      top: SetAnchor<Base> { appending(.top) }
    public var     left: PointAnchor<Base, Left, Attribute> { PointAnchor(item) }
    public var    right: PointAnchor<Base, Right, Attribute> { PointAnchor(item) }
    public var  leading: PointAnchor<Base, Leading, Attribute> { PointAnchor(item) }
    public var trailing: PointAnchor<Base, Trailing, Attribute> { PointAnchor(item) }
    public var   bottom: SetAnchor<Base> { appending(.bottom) }

    public var      topMargin: SetAnchor<Base> { appending(.topMargin) }
    public var     leftMargin: PointAnchor<Base, LeftMargin, Attribute> { PointAnchor(item) }
    public var    rightMargin: PointAnchor<Base, RightMargin, Attribute> { PointAnchor(item) }
    public var  leadingMargin: PointAnchor<Base, LeadingMargin, Attribute> { PointAnchor(item) }
    public var trailingMargin: PointAnchor<Base, TrailingMargin, Attribute> { PointAnchor(item) }
    public var   bottomMargin: SetAnchor<Base> { appending(.bottomMargin) }

    public var centerY: SetAnchor<Base> { appending(.centerY) }
    public var centerX: PointAnchor<Base, CenterX, Attribute> { PointAnchor(item) }

    public var centerXWithinMargins: PointAnchor<Base, CenterXWithinMargins, Attribute> { PointAnchor(item) }
    public var centerYWithinMargins: SetAnchor<Base> { appending(.centerYWithinMargins) }
}

extension SingleAnchor where Attribute.Kind.ValueKind == PositionValueKind, Base: FrameConstrainable {

    public var  width: SetAnchor<Base> { appending(.width) }
    public var height: SetAnchor<Base> { appending(.height) }
}

extension SingleAnchor where Base: BaselineConstrainable, Attribute.Kind.ValueKind == PositionValueKind, Attribute.Axis == YAxis {
    public var  lastBaseline: SetAnchor<Base> { appending(.lastBaseline)  }
    public var firstBaseline: SetAnchor<Base> { appending(.firstBaseline) }
}

// MARK: - Coordinate Anchor from X Dimension

extension SingleAnchor where Base: FrameConstrainable, Attribute.Kind.ValueKind == DimensionValueKind, Attribute.Axis == XAxis {
    public var      top: SetAnchor<Base> { appending(.top) }
    public var     left: SetAnchor<Base> { appending(.left) }
    public var    right: SetAnchor<Base> { appending(.right) }
    public var   bottom: SetAnchor<Base> { appending(.bottom) }
    public var  leading: SetAnchor<Base> { appending(.leading) }
    public var trailing: SetAnchor<Base> { appending(.trailing) }
    
    public var      topMargin: SetAnchor<Base> { appending(.topMargin) }
    public var     leftMargin: SetAnchor<Base> { appending(.leftMargin) }
    public var    rightMargin: SetAnchor<Base> { appending(.rightMargin) }
    public var   bottomMargin: SetAnchor<Base> { appending(.bottomMargin) }
    public var  leadingMargin: SetAnchor<Base> { appending(.leadingMargin) }
    public var trailingMargin: SetAnchor<Base> { appending(.trailingMargin) }
    
    public var centerX: SetAnchor<Base> { appending(.centerX) }
    public var centerY: SetAnchor<Base> { appending(.centerY) }
    
    public var centerXWithinMargins: SetAnchor<Base> { appending(.centerXWithinMargins) }
    public var centerYWithinMargins: SetAnchor<Base> { appending(.centerYWithinMargins) }
    
    public var  width: SetAnchor<Base> { appending(.width) }
    public var height: SizeAnchor<Base> { SizeAnchor(item) }
}

extension SingleAnchor where Base: BaselineConstrainable, Attribute.Kind.ValueKind == DimensionValueKind, Attribute.Axis == XAxis {
    public var  lastBaseline: SetAnchor<Base> { appending(.lastBaseline)  }
    public var firstBaseline: SetAnchor<Base> { appending(.firstBaseline) }
}

// MARK: - Coordinate Anchor from Y Dimension

extension SingleAnchor where Base: FrameConstrainable, Attribute.Kind.ValueKind == DimensionValueKind, Attribute.Axis == YAxis {
    public var      top: SetAnchor<Base> { appending(.top) }
    public var     left: SetAnchor<Base> { appending(.left) }
    public var    right: SetAnchor<Base> { appending(.right) }
    public var   bottom: SetAnchor<Base> { appending(.bottom) }
    public var  leading: SetAnchor<Base> { appending(.leading) }
    public var trailing: SetAnchor<Base> { appending(.trailing) }
    
    public var      topMargin: SetAnchor<Base> { appending(.topMargin) }
    public var     leftMargin: SetAnchor<Base> { appending(.leftMargin) }
    public var    rightMargin: SetAnchor<Base> { appending(.rightMargin) }
    public var   bottomMargin: SetAnchor<Base> { appending(.bottomMargin) }
    public var  leadingMargin: SetAnchor<Base> { appending(.leadingMargin) }
    public var trailingMargin: SetAnchor<Base> { appending(.trailingMargin) }
    
    public var centerX: SetAnchor<Base> { appending(.centerX) }
    public var centerY: SetAnchor<Base> { appending(.centerY) }
    
    public var centerXWithinMargins: SetAnchor<Base> { appending(.centerXWithinMargins) }
    public var centerYWithinMargins: SetAnchor<Base> { appending(.centerYWithinMargins) }
    
    public var  width: SizeAnchor<Base> { SizeAnchor(item) }
    public var height: SetAnchor<Base> { appending(.height) }
}

extension SingleAnchor where Base: BaselineConstrainable, Attribute.Kind.ValueKind == DimensionValueKind, Attribute.Axis == YAxis {
    public var  lastBaseline: SetAnchor<Base> { appending(.lastBaseline)  }
    public var firstBaseline: SetAnchor<Base> { appending(.firstBaseline) }
}

// MARK: - Disabling Redundant Top Attribute

extension SingleAnchor where Attribute == Top {
    @available(*, unavailable, message: "Redundant Anchor: .top")
    public var top: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .top and .topMargin refer to the same attribute")
    public var topMargin: SingleAnchor<Base, Attribute> { fatalError() }
}

// MARK: - Disabling Redundant CenterY Attribute

extension SingleAnchor where Attribute == CenterY {
    @available(*, unavailable, message: "Redundant Anchor: .centerY")
    public var centerY: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .centerY and .centerYWithinMargins refer to the same attribute")
    public var centerYWithinMargins: SingleAnchor<Base, Attribute> { fatalError() }
}

// MARK: - Disabling Redundant Bottom Attribute

extension SingleAnchor where Attribute == Bottom {
    @available(*, unavailable, message: "Redundant Anchor: .bottom")
    public var bottom: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .bottom and .bottomMargin refer to the same attribute")
    public var bottomMargin: SingleAnchor<Base, Attribute> { fatalError() }
}

// MARK: - Disabling Redundant TopMargin Attribute

extension SingleAnchor where Attribute == TopMargin {
    @available(*, unavailable, message: "Redundant Anchor: .topMargin and .top refer to the same attribute")
    public var top: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .topMargin")
    public var topMargin: SingleAnchor<Base, Attribute> { fatalError() }
}

// MARK: - Disabling Redundant CenterYWithinMargins Attribute

extension SingleAnchor where Attribute == CenterYWithinMargins {
    @available(*, unavailable, message: "Redundant Anchor: .centerYWithinMargins and .centerY refer to the same attribute")
    public var centerY: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .centerYWithinMargins")
    public var centerYWithinMargins: SingleAnchor<Base, Attribute> { fatalError() }
}

// MARK: - Disabling Redundant BottomMargin Attribute

extension SingleAnchor where Attribute == BottomMargin {
    @available(*, unavailable, message: "Redundant Anchor: .bottomMargin and .bottom refer to the same attribute")
    public var bottom: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .bottomMargin")
    public var bottomMargin: SingleAnchor<Base, Attribute> { fatalError() }
}

// MARK: - Disabling Redundant Left Attribute

extension SingleAnchor where Attribute == Left {
    @available(*, unavailable, message: "Redundant Anchor: .left")
    public var left: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .left and .leftMargin refer to the same attribute")
    public var leftMargin: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .left and .leading refer to the same attribute")
    public var leading: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .left and .leadingMargin refer to the same attribute")
    public var leadingMargin: SingleAnchor<Base, Attribute> { fatalError() }
}

// MARK: - Disabling Redundant Leading Attribute

extension SingleAnchor where Attribute == Leading {
    @available(*, unavailable, message: "Redundant Anchor: .leading and .left refer to the same attribute")
    public var left: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .leading and .leftMargin refer to the same attribute")
    public var leftMargin: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .leading")
    public var leading: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .leading and .leadingMargin refer to the same attribute")
    public var leadingMargin: SingleAnchor<Base, Attribute> { fatalError() }
}

// MARK: - Disabling Redundant CenterX Attribute

extension SingleAnchor where Attribute == CenterX {
    @available(*, unavailable, message: "Redundant Anchor: .centerX")
    public var centerX: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .centerX and .centerXWithinMargins refer to the same attribute")
    public var centerXWithinMargins: SingleAnchor<Base, Attribute> { fatalError() }
}

// MARK: - Disabling Redundant Trailing Attribute

extension SingleAnchor where Attribute == Trailing {
    @available(*, unavailable, message: "Redundant Anchor: .trailing")
    public var trailing: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .trailing and .trailingMargin refer to the same attribute")
    public var trailingMargin: SingleAnchor<Base, Attribute> { fatalError() }
}

// MARK: - Disabling Redundant Right Attribute

extension SingleAnchor where Attribute == Right {
    @available(*, unavailable, message: "Redundant Anchor: .right")
    public var right: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .right and .rightMargin refer to the same attribute")
    public var rightMargin: SingleAnchor<Base, Attribute> { fatalError() }
}

// MARK: - Disabling Redundant LeftMargin Attribute

extension SingleAnchor where Attribute == LeftMargin {
    @available(*, unavailable, message: "Redundant Anchor: .leftMargin and .left refer to the same attribute")
    public var left: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .leftMargin")
    public var leftMargin: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .leftMargin and .leading refer to the same attribute")
    public var leading: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .leftMargin and .leadingMargin refer to the same attribute")
    public var leadingMargin: SingleAnchor<Base, Attribute> { fatalError() }
}

// MARK: - Disabling Redundant LeadingMargin Attribute

extension SingleAnchor where Attribute == LeadingMargin {
    @available(*, unavailable, message: "Redundant Anchor: .leadingMargin and .left refer to the same attribute")
    public var left: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .leadingMargin and .leftMargin refer to the same attribute")
    public var leftMargin: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .leadingMargin and .leading refer to the same attribute")
    public var leading: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .leadingMargin")
    public var leadingMargin: SingleAnchor<Base, Attribute> { fatalError() }
}

// MARK: - Disabling Redundant CenterXWithinMargins Attribute

extension SingleAnchor where Attribute == CenterXWithinMargins {
    @available(*, unavailable, message: "Redundant Anchor: .centerXWithinMargins and .centerX refer to the same attribute")
    public var centerX: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .centerXWithinMargins")
    public var centerXWithinMargins: SingleAnchor<Base, Attribute> { fatalError() }
}

// MARK: - Disabling Redundant TrailingMargin Attribute

extension SingleAnchor where Attribute == TrailingMargin {
    @available(*, unavailable, message: "Redundant Anchor: .trailingMargin and .trailing refer to the same attribute")
    public var trailing: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .trailingMargin")
    public var trailingMargin: SingleAnchor<Base, Attribute> { fatalError() }
}

// MARK: - Disabling Redundant RightMargin Attribute

extension SingleAnchor where Attribute == RightMargin {
    @available(*, unavailable, message: "Redundant Anchor: .rightMargin and .right refer to the same attribute")
    public var right: SingleAnchor<Base, Attribute> { fatalError() }
    @available(*, unavailable, message: "Redundant Anchor: .rightMargin")
    public var rightMargin: SingleAnchor<Base, Attribute> { fatalError() }
}

// MARK: - Disabling Redundant FirstBaseline Attribute

extension SingleAnchor where Attribute == FirstBaseline {
    @available(*, unavailable, message: "Redundant Anchor: .firstBaseline")
    public var firstBaseline: SingleAnchor<Base, Attribute> { fatalError() }
}

// MARK: - Disabling Redundant LastBaseline Attribute

extension SingleAnchor where Attribute == LastBaseline {
    @available(*, unavailable, message: "Redundant Anchor: .lastBaseline")
    public var lastBaseline: SingleAnchor<Base, Attribute> { fatalError() }
}

// MARK: - Disabling Redundant Width Attribute

extension SingleAnchor where Attribute == Width {
    @available(*, unavailable, message: "Redundant Anchor: .width")
    public var width: SingleAnchor<Base, Attribute> { fatalError() }
}

// MARK: - Disabling Redundant Height Attribute

extension SingleAnchor where Attribute == Height {
    @available(*, unavailable, message: "Redundant Anchor: .height")
    public var height: SingleAnchor<Base, Attribute> { fatalError() }
}

extension PointAnchor where Base: FrameConstrainable {
    public var      top: SetAnchor<Base> { appending(.top) }
    public var     left: SetAnchor<Base> { appending(.left) }
    public var    right: SetAnchor<Base> { appending(.right) }
    public var   bottom: SetAnchor<Base> { appending(.bottom) }
    public var  leading: SetAnchor<Base> { appending(.leading) }
    public var trailing: SetAnchor<Base> { appending(.trailing) }

    public var      topMargin: SetAnchor<Base> { appending(.topMargin) }
    public var     leftMargin: SetAnchor<Base> { appending(.leftMargin) }
    public var    rightMargin: SetAnchor<Base> { appending(.rightMargin) }
    public var   bottomMargin: SetAnchor<Base> { appending(.bottomMargin) }
    public var  leadingMargin: SetAnchor<Base> { appending(.leadingMargin) }
    public var trailingMargin: SetAnchor<Base> { appending(.trailingMargin) }

    public var centerX: SetAnchor<Base> { appending(.centerX) }
    public var centerY: SetAnchor<Base> { appending(.centerY) }

    public var centerXWithinMargins: SetAnchor<Base> { appending(.centerXWithinMargins) }
    public var centerYWithinMargins: SetAnchor<Base> { appending(.centerYWithinMargins) }

    public var  width: SetAnchor<Base> { appending(.width) }
    public var height: SetAnchor<Base> { appending(.height) }
}

extension PointAnchor where Base: BaselineConstrainable {
    public var  lastBaseline: SetAnchor<Base> { appending(.lastBaseline)  }
    public var firstBaseline: SetAnchor<Base> { appending(.firstBaseline) }
}

extension SetAnchor where Base: FrameConstrainable {
    public var      top: SetAnchor<Base> { appending(.top) }
    public var     left: SetAnchor<Base> { appending(.left) }
    public var    right: SetAnchor<Base> { appending(.right) }
    public var   bottom: SetAnchor<Base> { appending(.bottom) }
    public var  leading: SetAnchor<Base> { appending(.leading) }
    public var trailing: SetAnchor<Base> { appending(.trailing) }

    public var      topMargin: SetAnchor<Base> { appending(.topMargin) }
    public var     leftMargin: SetAnchor<Base> { appending(.leftMargin) }
    public var    rightMargin: SetAnchor<Base> { appending(.rightMargin) }
    public var   bottomMargin: SetAnchor<Base> { appending(.bottomMargin) }
    public var  leadingMargin: SetAnchor<Base> { appending(.leadingMargin) }
    public var trailingMargin: SetAnchor<Base> { appending(.trailingMargin) }

    public var centerX: SetAnchor<Base> { appending(.centerX) }
    public var centerY: SetAnchor<Base> { appending(.centerY) }

    public var centerXWithinMargins: SetAnchor<Base> { appending(.centerXWithinMargins) }
    public var centerYWithinMargins: SetAnchor<Base> { appending(.centerYWithinMargins) }

    public var  width: SetAnchor<Base> { appending(.width) }
    public var height: SetAnchor<Base> { appending(.height) }
}

extension SetAnchor where Base: BaselineConstrainable {
    public var  lastBaseline: SetAnchor<Base> { appending(.lastBaseline)  }
    public var firstBaseline: SetAnchor<Base> { appending(.firstBaseline) }
}
