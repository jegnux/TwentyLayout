//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation

/// label.anchors.XXX == \.XXX
@available(*, unavailable, message: "You can't constraint an Anchor to itself, that's nonsense")
public func == <LHSBase, LHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<Anchors<LHSBase>, SingleAnchor<LHSBase, LHSAttribute>>
) {
    fatalError()
}

/// label.anchors.XXX <= \.XXX
@available(*, unavailable, message: "You can't constraint an Anchor to itself, that's nonsense")
public func <= <LHSBase, LHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<Anchors<LHSBase>, SingleAnchor<LHSBase, LHSAttribute>>
) {
    fatalError()
}

/// label.anchors.XXX >= \.XXX
@available(*, unavailable, message: "You can't constraint an Anchor to itself, that's nonsense")
public func >= <LHSBase, LHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<Anchors<LHSBase>, SingleAnchor<LHSBase, LHSAttribute>>
) {
    fatalError()
}

/// label.anchors.XXX == \.YYY
@available(*, unavailable, message: "You can't constraint these anchors together")
public func == <LHSBase, LHSAttribute, RHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<Anchors<LHSBase>, SingleAnchor<LHSBase, RHSAttribute>>
) {
    fatalError()
}

/// label.anchors.XXX <= \.YYY
@available(*, unavailable, message: "You can't constraint these anchors together")
public func <= <LHSBase, LHSAttribute, RHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<Anchors<LHSBase>, SingleAnchor<LHSBase, RHSAttribute>>
) {
    fatalError()
}

/// label.anchors.XXX >= \.YYY
@available(*, unavailable, message: "You can't constraint these anchors together")
public func >= <LHSBase, LHSAttribute, RHSAttribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: KeyPath<Anchors<LHSBase>, SingleAnchor<LHSBase, RHSAttribute>>
) {
    fatalError()
}
