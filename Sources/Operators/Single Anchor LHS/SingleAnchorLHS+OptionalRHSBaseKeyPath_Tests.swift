//
//  Created by Jérôme Alves on 20/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

class SingleAnchorLHS_OptionalRHSBaseKeyPath_Tests: XCTestCase {
    
     // MARK: - Positionable
     
     func test_positionable_equal() throws {
         let layout = makeConstraints { views in
            views.image.anchors.topMargin == \.superview
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .topMargin)
         XCTAssertEqual(constraint.relation, .equal)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .topMargin)
         XCTAssertEqual(constraint.priority, .required)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 0)
     }
     
     func test_positionable_equal_modified() throws {
         let layout = makeConstraints { views in
            views.image.anchors.leftMargin == \.superview
                 ~ .priority(.defaultLow)
                 ~ .offset(by: 80)
                 ~ .multiplied(by: 1.5)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .leftMargin)
         XCTAssertEqual(constraint.relation, .equal)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .leftMargin)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1.5)
         XCTAssertEqual(constraint.constant, 80)
     }
     
     func test_positionable_lessThanOrEqual() throws {
         let layout = makeConstraints { views in
            views.image.anchors.rightMargin <= \.superview
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .rightMargin)
         XCTAssertEqual(constraint.relation, .lessThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .rightMargin)
         XCTAssertEqual(constraint.priority, .required)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 0)
     }
     
     func test_positionable_lessThanOrEqual_modified() throws {
         let layout = makeConstraints { views in
            views.image.anchors.bottomMargin <= \.superview
                 ~ .priority(.defaultLow)
                ~ .inset(by: 80.0)
                 ~ .multiplied(by: 1.5)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .bottomMargin)
         XCTAssertEqual(constraint.relation, .lessThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .bottomMargin)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1.5)
         XCTAssertEqual(constraint.constant, -80)
     }
     
     func test_positionable_greaterThanOrEqual() throws {
         let layout = makeConstraints { views in
            views.image.anchors.leadingMargin >= \.superview
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .leadingMargin)
         XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .leadingMargin)
         XCTAssertEqual(constraint.priority, .required)
         XCTAssertEqual(constraint.multiplier, 1)
         XCTAssertEqual(constraint.constant, 0)
     }
     
     func test_positionable_greaterThanOrEqual_modified() throws {
         let layout = makeConstraints { views in
            views.image.anchors.trailingMargin >= \.superview
                 ~ .priority(.defaultLow)
                 ~ .offset(by: 80)
                 ~ .multiplied(by: 1.5)
         }
         
         XCTAssertEqual(layout.constraints.count, 1)
         
         let constraint = try XCTUnwrap(layout.constraints.first)
         
         XCTAssertEqual(constraint.firstItem, layout.views.image)
         XCTAssertEqual(constraint.firstAttribute, .trailingMargin)
         XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
         XCTAssertEqual(constraint.secondItem, layout.views.container)
         XCTAssertEqual(constraint.secondAttribute, .trailingMargin)
         XCTAssertEqual(constraint.priority, .defaultLow)
         XCTAssertEqual(constraint.multiplier, 1.5)
         XCTAssertEqual(constraint.constant, 80)
     }
    
    func test_nil_superview() throws {
        let layout = makeConstraints { views in
            views.container.anchors.topMargin == \.superview
            views.container.anchors.bottomMargin <= \.superview
            views.container.anchors.width >= \.superview
        }
        
        XCTAssertEqual(layout.constraints.count, 0)
    }

     // MARK: - Dimension
     
     func test_dimension_equal() throws {
         let layout = makeConstraints { views in
            views.image.anchors.width == \.superview
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
     
     func test_dimension_equal_modified() throws {
         let layout = makeConstraints { views in
            views.image.anchors.height == \.superview
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
     
     func test_dimension_lessThanOrEqual() throws {
         let layout = makeConstraints { views in
            views.image.anchors.width <= \.superview
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
     
     func test_dimension_lessThanOrEqual_modified() throws {
         let layout = makeConstraints { views in
            views.image.anchors.height <= \.superview
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
     
     func test_dimension_greaterThanOrEqual() throws {
         let layout = makeConstraints { views in
            views.image.anchors.width >= \.superview
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
     
     func test_dimension_greaterThanOrEqual_modified() throws {
         let layout = makeConstraints { views in
            views.image.anchors.height >= \.superview
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
