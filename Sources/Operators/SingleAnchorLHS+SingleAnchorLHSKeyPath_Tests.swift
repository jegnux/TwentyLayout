//
//  Created by Jérôme Alves on 20/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

class SingleAnchorLHS_SingleAnchorLHSKeyPath_Tests: XCTestCase {
    
     // MARK: - Equal
     
     func test_width_equal_height() throws {
         let layout = makeConstraints { views in
            views.image.anchors.width == \.height
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .width)
         XCTAssertEqual(constraint.relation, .equal)
         XCTAssertEqual(constraint.secondItem, layout.views.image)
         XCTAssertEqual(constraint.secondAttribute, .height)
         XCTAssertEqual(constraint.priority, .required)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 0)
     }
     
     func test_equal_width_height_modified() throws {
         let layout = makeConstraints { views in
            views.image.anchors.width == \.height
                 ~ .priority(.defaultLow)
                 ~ .offset(by: 80)
                 ~ .multiplied(by: 1.5)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .width)
         XCTAssertEqual(constraint.relation, .equal)
         XCTAssertEqual(constraint.secondItem, layout.views.image)
         XCTAssertEqual(constraint.secondAttribute, .height)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1.5)
         XCTAssertEqual(constraint.constant, 80)
     }
    
     func test_height_equal_width() throws {
         let layout = makeConstraints { views in
            views.image.anchors.height == \.width
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .height)
         XCTAssertEqual(constraint.relation, .equal)
         XCTAssertEqual(constraint.secondItem, layout.views.image)
         XCTAssertEqual(constraint.secondAttribute, .width)
         XCTAssertEqual(constraint.priority, .required)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 0)
     }
     
     func test_height_equal_width_modified() throws {
         let layout = makeConstraints { views in
            views.image.anchors.height == \.width
                 ~ .priority(.defaultLow)
                 ~ .offset(by: 80)
                 ~ .multiplied(by: 1.5)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .height)
         XCTAssertEqual(constraint.relation, .equal)
         XCTAssertEqual(constraint.secondItem, layout.views.image)
         XCTAssertEqual(constraint.secondAttribute, .width)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1.5)
         XCTAssertEqual(constraint.constant, 80)
     }
    
    // MARK: - Less Than Or Equal
    
     func test_width_lessThanOrEqual_height() throws {
         let layout = makeConstraints { views in
            views.image.anchors.width <= \.height
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .width)
         XCTAssertEqual(constraint.relation, .lessThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.image)
         XCTAssertEqual(constraint.secondAttribute, .height)
         XCTAssertEqual(constraint.priority, .required)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 0)
     }
     
     func test_width_lessThanOrEqual_height_modified() throws {
         let layout = makeConstraints { views in
            views.image.anchors.width <= \.height
                 ~ .priority(.defaultLow)
                 ~ .offset(by: 80)
                 ~ .multiplied(by: 1.5)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .width)
         XCTAssertEqual(constraint.relation, .lessThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.image)
         XCTAssertEqual(constraint.secondAttribute, .height)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1.5)
         XCTAssertEqual(constraint.constant, 80)
     }
    
     func test_height_lessThanOrEqual_width() throws {
         let layout = makeConstraints { views in
            views.image.anchors.height <= \.width
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .height)
         XCTAssertEqual(constraint.relation, .lessThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.image)
         XCTAssertEqual(constraint.secondAttribute, .width)
         XCTAssertEqual(constraint.priority, .required)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 0)
     }
     
     func test_height_lessThanOrEqual_width_modified() throws {
         let layout = makeConstraints { views in
            views.image.anchors.height <= \.width
                 ~ .priority(.defaultLow)
                 ~ .offset(by: 80)
                 ~ .multiplied(by: 1.5)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .height)
         XCTAssertEqual(constraint.relation, .lessThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.image)
         XCTAssertEqual(constraint.secondAttribute, .width)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1.5)
         XCTAssertEqual(constraint.constant, 80)
     }

    // MARK: - Greater Than Or Equal
    
     func test_width_greaterThanOrEqual_height() throws {
         let layout = makeConstraints { views in
            views.image.anchors.width >= \.height
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .width)
         XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.image)
         XCTAssertEqual(constraint.secondAttribute, .height)
         XCTAssertEqual(constraint.priority, .required)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 0)
     }
     
     func test_width_greaterThanOrEqual_height_modified() throws {
         let layout = makeConstraints { views in
            views.image.anchors.width >= \.height
                 ~ .priority(.defaultLow)
                 ~ .offset(by: 80)
                 ~ .multiplied(by: 1.5)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .width)
         XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.image)
         XCTAssertEqual(constraint.secondAttribute, .height)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1.5)
         XCTAssertEqual(constraint.constant, 80)
     }
    
     func test_height_greaterThanOrEqual_width() throws {
         let layout = makeConstraints { views in
            views.image.anchors.height >= \.width
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .height)
         XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.image)
         XCTAssertEqual(constraint.secondAttribute, .width)
         XCTAssertEqual(constraint.priority, .required)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 0)
     }
     
     func test_height_greaterThanOrEqual_width_modified() throws {
         let layout = makeConstraints { views in
            views.image.anchors.height >= \.width
                 ~ .priority(.defaultLow)
                 ~ .offset(by: 80)
                 ~ .multiplied(by: 1.5)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .height)
         XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.image)
         XCTAssertEqual(constraint.secondAttribute, .width)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1.5)
         XCTAssertEqual(constraint.constant, 80)
     }

}
