//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import XCTest

class SingleAnchorLHS_Primitives_Tests: XCTestCase {

     func test_positionable_equal() throws {
         let layout = makeConstraints { views in
             views.image.anchors.top == 20
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .top)
         XCTAssertEqual(constraint.relation, .equal)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .top)
         XCTAssertEqual(constraint.priority, .required)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 20)
     }
     
     func test_positionable_equal_modified() throws {
         let layout = makeConstraints { views in
             views.image.anchors.leading == 20
                 ~ .priority(.defaultLow)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .leading)
         XCTAssertEqual(constraint.relation, .equal)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .leading)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 20)
     }
     
     func test_positionable_lessThanOrEqual() throws {
         let layout = makeConstraints { views in
             views.image.anchors.bottom <= 20
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .bottom)
         XCTAssertEqual(constraint.relation, .lessThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .bottom)
         XCTAssertEqual(constraint.priority, .required)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 20)
     }
     
     func test_positionable_lessThanOrEqual_modified() throws {
         let layout = makeConstraints { views in
             views.image.anchors.trailing <= 20
                 ~ .priority(.defaultLow)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .trailing)
         XCTAssertEqual(constraint.relation, .lessThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .trailing)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 20)
     }
     
     func test_positionable_greaterThanOrEqual() throws {
         let layout = makeConstraints { views in
             views.image.anchors.top >= 20
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .top)
         XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .top)
         XCTAssertEqual(constraint.priority, .required)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 20)
     }
     
     func test_positionable_greaterThanOrEqual_modified() throws {
         let layout = makeConstraints { views in
             views.image.anchors.leading >= 20
                 ~ .priority(.defaultLow)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .leading)
         XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .leading)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 20)
     }
    
     // MARK: - Dimension
     
     func test_dimension_equal() throws {
         let layout = makeConstraints { views in
             views.image.anchors.width == 200
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .width)
         XCTAssertEqual(constraint.relation, .equal)
         XCTAssertNil(constraint.secondItem)
         XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
         XCTAssertEqual(constraint.priority, .required)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 200)
     }
     
     func test_dimension_equal_modified() throws {
         let layout = makeConstraints { views in
             views.image.anchors.height == 200
                 ~ .priority(.defaultLow)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .height)
         XCTAssertEqual(constraint.relation, .equal)
         XCTAssertNil(constraint.secondItem)
         XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 200)
     }
     
     func test_dimension_lessThanOrEqual() throws {
         let layout = makeConstraints { views in
             views.image.anchors.width <= 200
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .width)
         XCTAssertEqual(constraint.relation, .lessThanOrEqual)
         XCTAssertNil(constraint.secondItem)
         XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
         XCTAssertEqual(constraint.priority, .required)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 200)
     }
     
     func test_dimension_lessThanOrEqual_modified() throws {
         let layout = makeConstraints { views in
             views.image.anchors.height <= 200
                 ~ .priority(.defaultLow)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .height)
         XCTAssertEqual(constraint.relation, .lessThanOrEqual)
         XCTAssertNil(constraint.secondItem)
         XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 200)
     }
     
     func test_dimension_greaterThanOrEqual() throws {
         let layout = makeConstraints { views in
             views.image.anchors.width >= 200
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .width)
         XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
         XCTAssertNil(constraint.secondItem)
         XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
         XCTAssertEqual(constraint.priority, .required)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 200)
     }
     
     func test_dimension_greaterThanOrEqual_modified() throws {
         let layout = makeConstraints { views in
             views.image.anchors.height >= 200
                 ~ .priority(.defaultLow)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .height)
         XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
         XCTAssertNil(constraint.secondItem)
         XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 200)
     }

}
