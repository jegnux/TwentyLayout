//
//  ConstraintProperties_Tests.swift
//  TwentyLayout-iOS Tests
//
//  Created by Jérôme Alves on 13/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import XCTest
import TwentyLayout

class ConstraintProperties_Tests: XCTestCase {

    func test_int_default() {
        let x = 80

        XCTAssertNil(x.priority)
        XCTAssertNil(x.multiplier)
        XCTAssertEqual(x.constant(for: .top), 80)
    }

    func test_int_priority() {
        let x = 80
            ~ .priority(.required)
         // ~ .multiplied(by: 1.5)
         // ~ .offset(by: 10)
         // ⬆ MUST NOT COMPILE ⬆
        
        XCTAssertEqual(x.priority, .required)
        XCTAssertNil(x.multiplier)
        XCTAssertEqual(x.constant(for: .top), 80)
    }

    func test_keyPath() {
        let x = \UIView.anchors.top

        XCTAssertNil(x.priority)
        XCTAssertNil(x.multiplier)
        XCTAssertNil(x.constant(for: .top))
    }

    func test_keyPath_modified() {
        let x = \UIView.anchors.top
            ~ .offset(by: 20)
            ~ .multiplied(by: 1.5)
            ~ .priority(.required)

        XCTAssertEqual(x.priority, .required)
        XCTAssertEqual(x.multiplier, 1.5)
        XCTAssertEqual(x.constant(for: .top), 20)
    }

    func test_anchor() {
        let x = UIView().anchors.top

        XCTAssertNil(x.priority)
        XCTAssertNil(x.multiplier)
        XCTAssertNil(x.constant(for: .top))
    }

    func test_anchor_modified() {
        
        let x = UIView().anchors.top
            ~ .offset(by: 20)
            ~ .multiplied(by: 1.5)
            ~ .priority(.required)

        XCTAssertEqual(x.priority, .required)
        XCTAssertEqual(x.multiplier, 1.5)
        XCTAssertEqual(x.constant(for: .top), 20)
    }

    func test_size() {
        let x: CGSize = CGSize(width: 20, height: 40)

        XCTAssertNil(x.priority)
        XCTAssertNil(x.multiplier)
        XCTAssertNil(x.constant(for: .top))
        XCTAssertEqual(x.constant(for: .width), 20)
        XCTAssertEqual(x.constant(for: .height), 40)
    }

    func test_size_modified() {
        let x: ModifiedConstraintOperand<CGSize> = CGSize(width: 20, height: 40)
            ~ .priority(.required)
         // ~ .offset(by: 20)
         // ~ .multiplied(by: 1.5)
         // ⬆ MUST NOT COMPILE ⬆

        XCTAssertEqual(x.priority, .required)
        XCTAssertNil(x.multiplier)
        XCTAssertNil(x.constant(for: .top))
        XCTAssertEqual(x.constant(for: .width), 20)
        XCTAssertEqual(x.constant(for: .height), 40)
    }

}
