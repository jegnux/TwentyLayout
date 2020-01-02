//
//  MarginAttribute_Tests.swift
//  TwentyLayout-iOS Tests
//
//  Created by Jérôme Alves on 31/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import XCTest

class MarginAttribute_Tests: XCTestCase {

    func testRawValue() {
        XCTAssertEqual(Margin<Top>.rawValue, .topMargin)
        XCTAssertEqual(Margin<Left>.rawValue, .leftMargin)
        XCTAssertEqual(Margin<Leading>.rawValue, .leadingMargin)
        XCTAssertEqual(Margin<Trailing>.rawValue, .trailingMargin)
        XCTAssertEqual(Margin<Right>.rawValue, .rightMargin)
        XCTAssertEqual(Margin<Bottom>.rawValue, .bottomMargin)
    }

}
