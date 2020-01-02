//
//  WIthinMarginsAttribute_Tests.swift
//  TwentyLayout-iOS Tests
//
//  Created by Jérôme Alves on 31/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import XCTest

class WithinMarginsAttribute_Tests: XCTestCase {

    func testRawValue() {
        XCTAssertEqual(WithinMargins<CenterX>.rawValue, .centerXWithinMargins)
        XCTAssertEqual(WithinMargins<CenterY>.rawValue, .centerYWithinMargins)
    }

}
