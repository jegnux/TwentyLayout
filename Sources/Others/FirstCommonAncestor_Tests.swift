//
//  FirstCommonAncestorTests.swift
//  TwentyLayout-iOS Tests
//
//  Created by Jérôme Alves on 08/03/2020.
//  Copyright © 2020 TwentyLayout. All rights reserved.
//

import XCTest
@testable import TwentyLayout

class FirstCommonAncestorTests: XCTestCase {

    var a: UIView!
    var b: UIView!
    
    var s: UIView!
    var w: UIWindow!

    override func setUp() {
        super.setUp()
        a = UIView()
        b = UIView()
        
        s = UIView()
        w = UIWindow()
        w.addSubview(s, depth: 10)
    }
    
    override func tearDown() {
        a = nil
        b = nil
        
        s = nil
        w = nil
        super.tearDown()
    }
    
    
    func test_no_ancestor() throws {
        let ancestor = UIView.firstCommonAncestor(between: a, and: b)
        XCTAssertNil(ancestor)
    }

    func test_no_self_ancestor() throws {
        let ancestor = UIView.firstCommonAncestor(between: a, and: a)
        XCTAssertEqual(ancestor, a)
    }

    func test_A0() throws {
        s.addSubview(a, depth: 0)

        let ancestor = UIView.firstCommonAncestor(between: a, and: a)
        XCTAssertEqual(ancestor, a)
    }

    func test_A0_B0() throws {
        s.addSubview(a, depth: 0)
        s.addSubview(b, depth: 0)

        let ancestor = UIView.firstCommonAncestor(between: a, and: b)
        XCTAssertEqual(ancestor, s)
    }

    
    func test_A1_B1() throws {
        s.addSubview(a, depth: 1)
        s.addSubview(b, depth: 1)

        let ancestor = UIView.firstCommonAncestor(between: a, and: b)
        XCTAssertEqual(ancestor, s)
    }

    func test_A10_B10() throws {
        s.addSubview(a, depth: 10)
        s.addSubview(b, depth: 10)

        let ancestor = UIView.firstCommonAncestor(between: a, and: b)
        XCTAssertEqual(ancestor, s)
    }

    func test_A0_B10() throws {
        s.addSubview(a, depth: 0)
        s.addSubview(b, depth: 10)

        let ancestor = UIView.firstCommonAncestor(between: a, and: b)
        XCTAssertEqual(ancestor, s)
    }

    func test_A10_B0() throws {
        s.addSubview(a, depth: 10)
        s.addSubview(b, depth: 0)

        let ancestor = UIView.firstCommonAncestor(between: a, and: b)
        XCTAssertEqual(ancestor, s)
    }

    func test_A10_B8_C5_D3() throws {
        let c = UIView(), d = UIView()
        
        s.addSubview(a, depth: 10)
        s.addSubview(b, depth: 8)
        s.addSubview(c, depth: 5)
        s.addSubview(d, depth: 3)

        let ancestor = UIView.firstCommonAncestor(of: [a, b, c, d])
        XCTAssertEqual(ancestor, s)
    }

    func test_A10_B8_C5_D3_including_ancestor() throws {
        let c = UIView(), d = UIView()
        
        s.addSubview(a, depth: 10)
        s.addSubview(b, depth: 8)
        s.addSubview(c, depth: 5)
        s.addSubview(d, depth: 3)

        let ancestor = UIView.firstCommonAncestor(of: [s, a, b, c, d])
        XCTAssertEqual(ancestor, s)
    }

    func test_addSubviewDepth() {
        let s = UIView()
        s.addSubview(a, depth: 10)
        
        let stack = Array(sequence(first: a!, next: { $0.superview }))
        
        XCTAssertEqual(stack.count, 12)
        XCTAssertEqual(stack.first, a)
        XCTAssertEqual(stack.last, s)
    }
}

extension UIView {
    
    func addSubview(_ view: UIView, depth: Int) {
        if depth == 0 {
            addSubview(view)
        } else {
            let wrapper = UIView()
            addSubview(wrapper)
            wrapper.addSubview(view, depth: depth - 1)
        }
    }
}
