//
//  Layout_Tests.swift
//  TwentyLayout-iOS Tests
//
//  Created by Jérôme Alves on 05/04/2020.
//  Copyright © 2020 TwentyLayout. All rights reserved.
//

import XCTest
@testable import TwentyLayout

class LayoutController_Tests: XCTestCase {

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {

    }

    func testDiffedUpdate() throws {
        let wrapper = LayoutController()
        let views = ContainerView()
        
        func make(_ make: () -> Void) -> Result {
            let result = makeConstraints(views: views) { _ in make() }
            wrapper.wrappedValue = result.layout
            return result
        }
        
        let results1 = make {
            views.image.anchors.width == 200
            views.image.anchors.height == 200
            views.image.anchors.top == 20
        }
        
        let constraints1 = results1.constraints
        
        XCTAssertEqual(results1.layout.layoutConstraints.compactMap({ $0 }).count, 3)
        XCTAssertEqual(constraints1[1].constant, 200)

        let results2 = make {
            views.image.anchors.width == 200
            views.image.anchors.height == 400
            views.image.anchors.left == 20
        }
        
        let constraints2 = results2.constraints

        XCTAssertTrue(constraints1[0] === constraints2[0])
        XCTAssertTrue(constraints1[1] === constraints2[1])
        XCTAssertFalse(constraints1[2] === constraints2[2])

        XCTAssertEqual(results1.layout.layoutConstraints.compactMap({ $0 }).count, 1)
        XCTAssertEqual(results2.layout.layoutConstraints.compactMap({ $0 }).count, 3)
        XCTAssertEqual(constraints1[1].constant, 400)

        wrapper.wrappedValue = results1.layout

        XCTAssertEqual(results1.layout.layoutConstraints.compactMap({ $0 }).count, 3)
        XCTAssertEqual(results2.layout.layoutConstraints.compactMap({ $0 }).count, 1)
        XCTAssertEqual(constraints1[1].constant, 200)
    }

}
