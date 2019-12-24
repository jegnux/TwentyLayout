//
//  Created by Jérôme Alves on 07/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation

// MARK: Single Anchor

extension Anchors where Base: FrameConstrainable {
    public var    edges: AnchorSet<Base> { top.leading.trailing.bottom }
    public var  margins: AnchorSet<Base> { topMargin.leadingMargin.trailingMargin.bottomMargin }
    public var  center: PointAnchor<Base, CenterX, CenterY> { centerX.centerY }

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
    public var           top: PointAnchor<Base, Attribute, Top> { PointAnchor(item) }
    public var       centerY: PointAnchor<Base, Attribute, CenterY> { PointAnchor(item) }
    public var        bottom: PointAnchor<Base, Attribute, Bottom> { PointAnchor(item) }

    public var     topMargin: PointAnchor<Base, Attribute, Top> { PointAnchor(item) }
    public var centerYMargin: PointAnchor<Base, Attribute, CenterY> { PointAnchor(item) }
    public var  bottomMargin: PointAnchor<Base, Attribute, Bottom> { PointAnchor(item) }
}

extension SingleAnchor where Base: BaselineConstrainable, Attribute.Kind.ValueKind == PositionValueKind, Attribute.Axis == XAxis {
    public var firstBaseline: PointAnchor<Base, Attribute, FirstBaseline> { PointAnchor(item) }
    public var  lastBaseline: PointAnchor<Base, Attribute, LastBaseline> { PointAnchor(item) }
}

// MARK: - Coordinate Anchor from YAxis

extension SingleAnchor where Attribute.Kind.ValueKind == PositionValueKind, Attribute.Axis == YAxis {
    public var     left: PointAnchor<Base, Left, Attribute> { PointAnchor(item) }
    public var    right: PointAnchor<Base, Right, Attribute> { PointAnchor(item) }
    public var  leading: PointAnchor<Base, Leading, Attribute> { PointAnchor(item) }
    public var trailing: PointAnchor<Base, Trailing, Attribute> { PointAnchor(item) }
    public var  centerX: PointAnchor<Base, CenterX, Attribute> { PointAnchor(item) }

    public var     leftMargin: PointAnchor<Base, Left, Attribute> { PointAnchor(item) }
    public var    rightMargin: PointAnchor<Base, Right, Attribute> { PointAnchor(item) }
    public var  leadingMargin: PointAnchor<Base, Leading, Attribute> { PointAnchor(item) }
    public var trailingMargin: PointAnchor<Base, Trailing, Attribute> { PointAnchor(item) }
    public var centerXWithinMargins: PointAnchor<Base, CenterX, Attribute> { PointAnchor(item) }
}


// MARK: - Coordinate Anchor from X Dimension

extension SingleAnchor where Base: FrameConstrainable, Attribute.Kind.ValueKind == DimensionValueKind, Attribute.Axis == XAxis {
    public var height: SizeAnchor<Base> { SizeAnchor(item) }
}

// MARK: - Coordinate Anchor from Y Dimension

extension SingleAnchor where Base: FrameConstrainable, Attribute.Kind.ValueKind == DimensionValueKind, Attribute.Axis == YAxis {
    public var width: SizeAnchor<Base> { SizeAnchor(item) }
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
    public var      top: AnchorSet<Base> { appending(.top) }
    public var     left: AnchorSet<Base> { appending(.left) }
    public var    right: AnchorSet<Base> { appending(.right) }
    public var   bottom: AnchorSet<Base> { appending(.bottom) }
    public var  leading: AnchorSet<Base> { appending(.leading) }
    public var trailing: AnchorSet<Base> { appending(.trailing) }

    public var      topMargin: AnchorSet<Base> { appending(.topMargin) }
    public var     leftMargin: AnchorSet<Base> { appending(.leftMargin) }
    public var    rightMargin: AnchorSet<Base> { appending(.rightMargin) }
    public var   bottomMargin: AnchorSet<Base> { appending(.bottomMargin) }
    public var  leadingMargin: AnchorSet<Base> { appending(.leadingMargin) }
    public var trailingMargin: AnchorSet<Base> { appending(.trailingMargin) }

    public var centerX: AnchorSet<Base> { appending(.centerX) }
    public var centerY: AnchorSet<Base> { appending(.centerY) }

    public var centerXWithinMargins: AnchorSet<Base> { appending(.centerXWithinMargins) }
    public var centerYWithinMargins: AnchorSet<Base> { appending(.centerYWithinMargins) }

    public var  width: AnchorSet<Base> { appending(.width) }
    public var height: AnchorSet<Base> { appending(.height) }
}

extension PointAnchor where Base: BaselineConstrainable {
    public var  lastBaseline: AnchorSet<Base> { appending(.lastBaseline)  }
    public var firstBaseline: AnchorSet<Base> { appending(.firstBaseline) }
}

extension AnchorSet where Base: FrameConstrainable {
    public var      top: AnchorSet<Base> { appending(.top) }
    public var     left: AnchorSet<Base> { appending(.left) }
    public var    right: AnchorSet<Base> { appending(.right) }
    public var   bottom: AnchorSet<Base> { appending(.bottom) }
    public var  leading: AnchorSet<Base> { appending(.leading) }
    public var trailing: AnchorSet<Base> { appending(.trailing) }

    public var      topMargin: AnchorSet<Base> { appending(.topMargin) }
    public var     leftMargin: AnchorSet<Base> { appending(.leftMargin) }
    public var    rightMargin: AnchorSet<Base> { appending(.rightMargin) }
    public var   bottomMargin: AnchorSet<Base> { appending(.bottomMargin) }
    public var  leadingMargin: AnchorSet<Base> { appending(.leadingMargin) }
    public var trailingMargin: AnchorSet<Base> { appending(.trailingMargin) }

    public var centerX: AnchorSet<Base> { appending(.centerX) }
    public var centerY: AnchorSet<Base> { appending(.centerY) }

    public var centerXWithinMargins: AnchorSet<Base> { appending(.centerXWithinMargins) }
    public var centerYWithinMargins: AnchorSet<Base> { appending(.centerYWithinMargins) }

    public var  width: AnchorSet<Base> { appending(.width) }
    public var height: AnchorSet<Base> { appending(.height) }
}

extension AnchorSet where Base: BaselineConstrainable {
    public var  lastBaseline: AnchorSet<Base> { appending(.lastBaseline)  }
    public var firstBaseline: AnchorSet<Base> { appending(.firstBaseline) }
}
