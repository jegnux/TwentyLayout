//
//  Stack_Tests.swift
//  TwentyLayout-iOS Tests
//
//  Created by Jérôme Alves on 23/01/2020.
//  Copyright © 2020 TwentyLayout. All rights reserved.
//

import XCTest

class Stack_Tests: XCTestCase {

    func testStackSpacing() {
        let layout = makeConstraints { views in
            Layout.stack(
                axis: .vertical,
                spacing: 8,
                content: [views.image, views.detail, CustomSpacing(16), views.guide, views.loading]
            )
        }
        
        guard layout.constraints.count == 9 else {
            return XCTFail()
        }

        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
        XCTAssertEqual(layout.constraints[0].relation, .equal)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.image)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .bottom)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 8)

        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .leading)
        XCTAssertEqual(layout.constraints[1].relation, .equal)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.image)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .leading)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 0)

        XCTAssertEqual(layout.constraints[2].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[2].firstAttribute, .trailing)
        XCTAssertEqual(layout.constraints[2].relation, .equal)
        XCTAssertEqual(layout.constraints[2].secondItem, layout.views.image)
        XCTAssertEqual(layout.constraints[2].secondAttribute, .trailing)
        XCTAssertEqual(layout.constraints[2].priority, .required)
        XCTAssertEqual(layout.constraints[2].multiplier, 1)
        XCTAssertEqual(layout.constraints[2].constant, 0)
        
        XCTAssertEqual(layout.constraints[3].firstItem, layout.views.guide)
        XCTAssertEqual(layout.constraints[3].firstAttribute, .top)
        XCTAssertEqual(layout.constraints[3].relation, .equal)
        XCTAssertEqual(layout.constraints[3].secondItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[3].secondAttribute, .bottom)
        XCTAssertEqual(layout.constraints[3].priority, .required)
        XCTAssertEqual(layout.constraints[3].multiplier, 1)
        XCTAssertEqual(layout.constraints[3].constant, 16)

        XCTAssertEqual(layout.constraints[4].firstItem, layout.views.guide)
        XCTAssertEqual(layout.constraints[4].firstAttribute, .leading)
        XCTAssertEqual(layout.constraints[4].relation, .equal)
        XCTAssertEqual(layout.constraints[4].secondItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[4].secondAttribute, .leading)
        XCTAssertEqual(layout.constraints[4].priority, .required)
        XCTAssertEqual(layout.constraints[4].multiplier, 1)
        XCTAssertEqual(layout.constraints[4].constant, 0)

        XCTAssertEqual(layout.constraints[5].firstItem, layout.views.guide)
        XCTAssertEqual(layout.constraints[5].firstAttribute, .trailing)
        XCTAssertEqual(layout.constraints[5].relation, .equal)
        XCTAssertEqual(layout.constraints[5].secondItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[5].secondAttribute, .trailing)
        XCTAssertEqual(layout.constraints[5].priority, .required)
        XCTAssertEqual(layout.constraints[5].multiplier, 1)
        XCTAssertEqual(layout.constraints[5].constant, 0)

        XCTAssertEqual(layout.constraints[6].firstItem, layout.views.loading)
        XCTAssertEqual(layout.constraints[6].firstAttribute, .top)
        XCTAssertEqual(layout.constraints[6].relation, .equal)
        XCTAssertEqual(layout.constraints[6].secondItem, layout.views.guide)
        XCTAssertEqual(layout.constraints[6].secondAttribute, .bottom)
        XCTAssertEqual(layout.constraints[6].priority, .required)
        XCTAssertEqual(layout.constraints[6].multiplier, 1)
        XCTAssertEqual(layout.constraints[6].constant, 8)

        XCTAssertEqual(layout.constraints[7].firstItem, layout.views.loading)
        XCTAssertEqual(layout.constraints[7].firstAttribute, .leading)
        XCTAssertEqual(layout.constraints[7].relation, .equal)
        XCTAssertEqual(layout.constraints[7].secondItem, layout.views.guide)
        XCTAssertEqual(layout.constraints[7].secondAttribute, .leading)
        XCTAssertEqual(layout.constraints[7].priority, .required)
        XCTAssertEqual(layout.constraints[7].multiplier, 1)
        XCTAssertEqual(layout.constraints[7].constant, 0)

        XCTAssertEqual(layout.constraints[8].firstItem, layout.views.loading)
        XCTAssertEqual(layout.constraints[8].firstAttribute, .trailing)
        XCTAssertEqual(layout.constraints[8].relation, .equal)
        XCTAssertEqual(layout.constraints[8].secondItem, layout.views.guide)
        XCTAssertEqual(layout.constraints[8].secondAttribute, .trailing)
        XCTAssertEqual(layout.constraints[8].priority, .required)
        XCTAssertEqual(layout.constraints[8].multiplier, 1)
        XCTAssertEqual(layout.constraints[8].constant, 0)
    }


}
