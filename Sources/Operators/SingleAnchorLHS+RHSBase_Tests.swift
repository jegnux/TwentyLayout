//
//  Created by Jérôme Alves on 20/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

class SingleAnchorLHS_RHSBase_Tests: XCTestCase {
    
     // MARK: - Positionable
     
     func test_positionable_equal() throws {
         let layout = makeConstraints { views in
             views.image.anchors.top == views.container
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
         XCTAssertEqual(constraint.constant, 0)
     }
     
     func test_positionable_equal_modified() throws {
         let layout = makeConstraints { views in
             views.image.anchors.leading == views.container
                 ~ .priority(.defaultLow)
                 ~ .offset(by: 80)
                 ~ .multiplied(by: 1.5)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .leading)
         XCTAssertEqual(constraint.relation, .equal)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .leading)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1.5)
         XCTAssertEqual(constraint.constant, 80)
     }
     
     func test_positionable_lessThanOrEqual() throws {
         let layout = makeConstraints { views in
             views.image.anchors.top <= views.container
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .top)
         XCTAssertEqual(constraint.relation, .lessThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .top)
         XCTAssertEqual(constraint.priority, .required)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 0)
     }
     
     func test_positionable_lessThanOrEqual_modified() throws {
         let layout = makeConstraints { views in
             views.image.anchors.leading <= views.container
                 ~ .priority(.defaultLow)
                 ~ .offset(by: 80)
                 ~ .multiplied(by: 1.5)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .leading)
         XCTAssertEqual(constraint.relation, .lessThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .leading)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1.5)
         XCTAssertEqual(constraint.constant, 80)
     }
     
     func test_positionable_greaterThanOrEqual() throws {
         let layout = makeConstraints { views in
             views.image.anchors.top >= views.container
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
         XCTAssertEqual(constraint.constant, 0)
     }
     
     func test_positionable_greaterThanOrEqual_modified() throws {
         let layout = makeConstraints { views in
             views.image.anchors.leading >= views.container
                 ~ .priority(.defaultLow)
                 ~ .offset(by: 80)
                 ~ .multiplied(by: 1.5)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .leading)
         XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .leading)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1.5)
         XCTAssertEqual(constraint.constant, 80)
     }
    
     // MARK: - Dimension
     
     func test_Dimension_equal() throws {
         let layout = makeConstraints { views in
             views.image.anchors.width == views.container
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .width)
         XCTAssertEqual(constraint.relation, .equal)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .width)
         XCTAssertEqual(constraint.priority, .required)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 0)
     }
     
     func test_Dimension_equal_modified() throws {
         let layout = makeConstraints { views in
             views.image.anchors.height == views.container
                 ~ .priority(.defaultLow)
                 ~ .offset(by: 80)
                 ~ .multiplied(by: 1.5)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .height)
         XCTAssertEqual(constraint.relation, .equal)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .height)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1.5)
         XCTAssertEqual(constraint.constant, 80)
     }
     
     func test_Dimension_lessThanOrEqual() throws {
         let layout = makeConstraints { views in
             views.image.anchors.width <= views.container
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .width)
         XCTAssertEqual(constraint.relation, .lessThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .width)
         XCTAssertEqual(constraint.priority, .required)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 0)
     }
     
     func test_Dimension_lessThanOrEqual_modified() throws {
         let layout = makeConstraints { views in
             views.image.anchors.height <= views.container
                 ~ .priority(.defaultLow)
                 ~ .offset(by: 80)
                 ~ .multiplied(by: 1.5)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .height)
         XCTAssertEqual(constraint.relation, .lessThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .height)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1.5)
         XCTAssertEqual(constraint.constant, 80)
     }
     
     func test_Dimension_greaterThanOrEqual() throws {
         let layout = makeConstraints { views in
             views.image.anchors.width >= views.container
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .width)
         XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .width)
         XCTAssertEqual(constraint.priority, .required)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 0)
     }
     
     func test_Dimension_greaterThanOrEqual_modified() throws {
         let layout = makeConstraints { views in
             views.image.anchors.height >= views.container
                 ~ .priority(.defaultLow)
                 ~ .offset(by: 80)
                 ~ .multiplied(by: 1.5)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .height)
         XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .height)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1.5)
         XCTAssertEqual(constraint.constant, 80)
     }

}
