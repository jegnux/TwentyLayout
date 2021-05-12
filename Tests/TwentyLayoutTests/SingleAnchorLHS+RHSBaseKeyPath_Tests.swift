//
//  Created by Jérôme Alves on 20/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

class SingleAnchorLHS_RHSBaseKeyPath_Tests: XCTestCase {
    
    // MARK: - Positionable
    
    func test_positionable_equal() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.left == \.subtitleLabel
        }
        
        XCTAssertEqual(layout.constraints.count, 1)
        
        let constraint = try XCTUnwrap(layout.constraints.first)
        
        XCTAssertEqual(constraint.firstItem, layout.views.detail)
        XCTAssertEqual(constraint.firstAttribute, .left)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertEqual(constraint.secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(constraint.secondAttribute, .left)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
    }
    
    func test_positionable_equal_modified() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.right == \.subtitleLabel
                ~ .priority(.defaultLow)
                ~ .offset(by: 80)
                ~ .multiplied(by: 1.5)
        }
        
        XCTAssertEqual(layout.constraints.count, 1)
        
        let constraint = try XCTUnwrap(layout.constraints.first)
        
        XCTAssertEqual(constraint.firstItem, layout.views.detail)
        XCTAssertEqual(constraint.firstAttribute, .right)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertEqual(constraint.secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(constraint.secondAttribute, .right)
        XCTAssertEqual(constraint.priority, .defaultLow)
        XCTAssertEqual(constraint.multiplier, 1.5)
        XCTAssertEqual(constraint.constant, 80)
    }
    
    func test_positionable_lessThanOrEqual() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.topMargin <= \.subtitleLabel
        }
        
        XCTAssertEqual(layout.constraints.count, 1)
        
        let constraint = try XCTUnwrap(layout.constraints.first)
        
        XCTAssertEqual(constraint.firstItem, layout.views.detail)
        XCTAssertEqual(constraint.firstAttribute, .topMargin)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertEqual(constraint.secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(constraint.secondAttribute, .topMargin)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
    }
    
    func test_positionable_lessThanOrEqual_modified() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.bottomMargin <= \.subtitleLabel
                ~ .priority(.defaultLow)
                ~ .offset(by: 80)
                ~ .multiplied(by: 1.5)
        }
        
        XCTAssertEqual(layout.constraints.count, 1)
        
        let constraint = try XCTUnwrap(layout.constraints.first)
        
        XCTAssertEqual(constraint.firstItem, layout.views.detail)
        XCTAssertEqual(constraint.firstAttribute, .bottomMargin)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertEqual(constraint.secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(constraint.secondAttribute, .bottomMargin)
        XCTAssertEqual(constraint.priority, .defaultLow)
        XCTAssertEqual(constraint.multiplier, 1.5)
        XCTAssertEqual(constraint.constant, 80)
    }
    
    func test_positionable_greaterThanOrEqual() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.centerXWithinMargins >= \.subtitleLabel
        }
        
        XCTAssertEqual(layout.constraints.count, 1)
        
        let constraint = try XCTUnwrap(layout.constraints.first)
        
        XCTAssertEqual(constraint.firstItem, layout.views.detail)
        XCTAssertEqual(constraint.firstAttribute, .centerXWithinMargins)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertEqual(constraint.secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(constraint.secondAttribute, .centerXWithinMargins)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
    }
    
    func test_positionable_greaterThanOrEqual_modified() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.centerYWithinMargins >= \.subtitleLabel
                ~ .priority(.defaultLow)
                ~ .offset(by: 80)
                ~ .multiplied(by: 1.5)
        }
        
        XCTAssertEqual(layout.constraints.count, 1)
        
        let constraint = try XCTUnwrap(layout.constraints.first)
        
        XCTAssertEqual(constraint.firstItem, layout.views.detail)
        XCTAssertEqual(constraint.firstAttribute, .centerYWithinMargins)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertEqual(constraint.secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(constraint.secondAttribute, .centerYWithinMargins)
        XCTAssertEqual(constraint.priority, .defaultLow)
        XCTAssertEqual(constraint.multiplier, 1.5)
        XCTAssertEqual(constraint.constant, 80)
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
