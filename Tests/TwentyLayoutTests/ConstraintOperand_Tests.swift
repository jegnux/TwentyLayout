//
//  ConstraintProperties_Tests.swift
//  TwentyLayout-iOS Tests
//
//  Created by Jérôme Alves on 13/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import XCTest
import TwentyLayout

class ConstraintOperand_Tests: XCTestCase {

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

    func test_anchor_keyPath() {
        let x = \UIView.anchors.top

        XCTAssertNil(x.priority)
        XCTAssertNil(x.multiplier)
        XCTAssertNil(x.constant(for: .top))
    }

    func test_anchor_keyPath_modified() {
        let x = \UIView.anchors.top
            ~ .offset(by: 20)
            ~ .multiplied(by: 1.5)
            ~ .priority(.required)

        XCTAssertEqual(x.priority, .required)
        XCTAssertEqual(x.multiplier, 1.5)
        XCTAssertEqual(x.constant(for: .top), 20)
    }

    
    func test_superview_keyPath() {
        let x = \UIView.superview

        XCTAssertNil(x.priority)
        XCTAssertNil(x.multiplier)
        XCTAssertNil(x.constant(for: .top))
    }

    func test_superview_keyPath_modified() {
        let x = \UIView.superview
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

    func test_pointAnchor() {
        let x = UIView().anchors.top.left

        XCTAssertNil(x.priority)
        XCTAssertNil(x.multiplier)
        XCTAssertNil(x.constant(for: .top))
        XCTAssertNil(x.constant(for: .left))
    }

    func test_pointAnchor_modified() {
        let x: ModifiedConstraintOperand<PointAnchor<UIView, Left, Top>> = UIView().anchors.top.left
            ~ .priority(.required)
            ~ .offset(by: 20)
            ~ .multiplied(by: 1.5)

        XCTAssertEqual(x.priority, .required)
        XCTAssertEqual(x.multiplier, 1.5)
        XCTAssertEqual(x.constant(for: .top), 20)
        XCTAssertEqual(x.constant(for: .left), 20)
    }

    func test_pointAnchor_modified_inset() {
        let x: ModifiedConstraintOperand<PointAnchor<UIView, Right, Top>> = UIView().anchors.top.right
            ~ .priority(.required)
            ~ .inset(by: 20)
            ~ .multiplied(by: 1.5)

        XCTAssertEqual(x.priority, .required)
        XCTAssertEqual(x.multiplier, 1.5)
        XCTAssertEqual(x.constant(for: .top), 20)
        XCTAssertEqual(x.constant(for: .right), -20)
    }

}
