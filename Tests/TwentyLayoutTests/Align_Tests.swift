//
//  Align_Tests.swift
//  TwentyLayout-iOS Tests
//
//  Created by Jérôme Alves on 19/01/2020.
//  Copyright © 2020 TwentyLayout. All rights reserved.
//

import XCTest
@testable import TwentyLayout

class Align_Tests: XCTestCase {

    func testRegularAlignments() {
        let sut: Alignment = [.top, .bottom, .left, .right, .leading, .trailing]
        XCTAssertEqual(sut.attributes, [.top, .bottom, .left, .right, .leading, .trailing])
    }

    func testMarginAlignments() {
        let sut: Alignment = [.topMargin, .bottomMargin, .leftMargin, .rightMargin, .leadingMargin, .trailingMargin]
        XCTAssertEqual(sut.attributes, [.topMargin, .bottomMargin, .leftMargin, .rightMargin, .leadingMargin, .trailingMargin])
    }

    func testAllAlignments() {
        let sut: Alignment = [.top, .bottom, .left, .right, .leading, .trailing, .topMargin, .bottomMargin, .leftMargin, .rightMargin, .leadingMargin, .trailingMargin]
        XCTAssertEqual(sut.attributes, [.top, .bottom, .left, .right, .leading, .trailing, .topMargin, .bottomMargin, .leftMargin, .rightMargin, .leadingMargin, .trailingMargin])
    }

    func testAlign() {
        let layout = makeConstraints { views in
            Layout.align(
                [views.image, views.detail, views.guide, views.loading],
                on: .leading,
                priority: .defaultHigh
            )
        }
        
        guard layout.constraints.count == 3 else {
            return XCTFail()
        }

        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .leading)
        XCTAssertEqual(layout.constraints[0].relation, .equal)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .leading)
        XCTAssertEqual(layout.constraints[0].priority, .defaultHigh)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 0)

        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .leading)
        XCTAssertEqual(layout.constraints[1].relation, .equal)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.guide)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .leading)
        XCTAssertEqual(layout.constraints[1].priority, .defaultHigh)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 0)

        XCTAssertEqual(layout.constraints[2].firstItem, layout.views.guide)
        XCTAssertEqual(layout.constraints[2].firstAttribute, .leading)
        XCTAssertEqual(layout.constraints[2].relation, .equal)
        XCTAssertEqual(layout.constraints[2].secondItem, layout.views.loading)
        XCTAssertEqual(layout.constraints[2].secondAttribute, .leading)
        XCTAssertEqual(layout.constraints[2].priority, .defaultHigh)
        XCTAssertEqual(layout.constraints[2].multiplier, 1)
        XCTAssertEqual(layout.constraints[2].constant, 0)

    }

}
