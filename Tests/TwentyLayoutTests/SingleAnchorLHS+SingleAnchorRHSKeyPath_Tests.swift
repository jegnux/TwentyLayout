//
//  Created by Jérôme Alves on 20/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

class SingleAnchorLHS_SingleAnchorRHSKeyPath_Tests: XCTestCase {
    
    // MARK: - Positionable
    
    func test_positionable_equal() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.centerY == \.subtitleLabel.anchors.firstBaseline
        }
        
        XCTAssertEqual(layout.constraints.count, 1)
        
        let constraint = try XCTUnwrap(layout.constraints.first)
        
        XCTAssertEqual(constraint.firstItem, layout.views.detail)
        XCTAssertEqual(constraint.firstAttribute, .centerY)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertEqual(constraint.secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(constraint.secondAttribute, .firstBaseline)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
    }
    
    func test_positionable_equal_modified() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.centerY == \.subtitleLabel.anchors.lastBaseline
                ~ .priority(.defaultLow)
                ~ .offset(by: 80)
                ~ .multiplied(by: 1.5)
        }
        
        XCTAssertEqual(layout.constraints.count, 1)
        
        let constraint = try XCTUnwrap(layout.constraints.first)
        
        XCTAssertEqual(constraint.firstItem, layout.views.detail)
        XCTAssertEqual(constraint.firstAttribute, .centerY)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertEqual(constraint.secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(constraint.secondAttribute, .lastBaseline)
        XCTAssertEqual(constraint.priority, .defaultLow)
        XCTAssertEqual(constraint.multiplier, 1.5)
        XCTAssertEqual(constraint.constant, 80)
    }
    
    func test_positionable_lessThanOrEqual() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.centerY <= \.subtitleLabel.anchors.bottom
        }
        
        XCTAssertEqual(layout.constraints.count, 1)
        
        let constraint = try XCTUnwrap(layout.constraints.first)
        
        XCTAssertEqual(constraint.firstItem, layout.views.detail)
        XCTAssertEqual(constraint.firstAttribute, .centerY)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertEqual(constraint.secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
    }
    
    func test_positionable_lessThanOrEqual_modified() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.centerY <= \.subtitleLabel.anchors.bottom
                ~ .priority(.defaultLow)
                ~ .offset(by: 80)
                ~ .multiplied(by: 1.5)
        }
        
        XCTAssertEqual(layout.constraints.count, 1)
        
        let constraint = try XCTUnwrap(layout.constraints.first)
        
        XCTAssertEqual(constraint.firstItem, layout.views.detail)
        XCTAssertEqual(constraint.firstAttribute, .centerY)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertEqual(constraint.secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
        XCTAssertEqual(constraint.priority, .defaultLow)
        XCTAssertEqual(constraint.multiplier, 1.5)
        XCTAssertEqual(constraint.constant, 80)
    }
    
    func test_positionable_greaterThanOrEqual() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.centerY >= \.subtitleLabel.anchors.bottom
        }
        
        XCTAssertEqual(layout.constraints.count, 1)
        
        let constraint = try XCTUnwrap(layout.constraints.first)
        
        XCTAssertEqual(constraint.firstItem, layout.views.detail)
        XCTAssertEqual(constraint.firstAttribute, .centerY)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertEqual(constraint.secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
    }
    
    func test_positionable_greaterThanOrEqual_modified() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.centerY >= \.subtitleLabel.anchors.bottom
                ~ .priority(.defaultLow)
                ~ .offset(by: 80)
                ~ .multiplied(by: 1.5)
        }
        
        XCTAssertEqual(layout.constraints.count, 1)
        
        let constraint = try XCTUnwrap(layout.constraints.first)
        
        XCTAssertEqual(constraint.firstItem, layout.views.detail)
        XCTAssertEqual(constraint.firstAttribute, .centerY)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertEqual(constraint.secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
        XCTAssertEqual(constraint.priority, .defaultLow)
        XCTAssertEqual(constraint.multiplier, 1.5)
        XCTAssertEqual(constraint.constant, 80)
    }
    
    // MARK: - dimension
    
    func test_dimension_equal() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.width == \.subtitleLabel.anchors.height
        }
        
        XCTAssertEqual(layout.constraints.count, 1)
        
        let constraint = try XCTUnwrap(layout.constraints.first)
        
        XCTAssertEqual(constraint.firstItem, layout.views.detail)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertEqual(constraint.secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(constraint.secondAttribute, .height)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
    }
    
    func test_dimension_equal_modified() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.width == \.subtitleLabel.anchors.width
                ~ .priority(.defaultLow)
                ~ .offset(by: 80)
                ~ .multiplied(by: 1.5)
        }
        
        XCTAssertEqual(layout.constraints.count, 1)
        
        let constraint = try XCTUnwrap(layout.constraints.first)
        
        XCTAssertEqual(constraint.firstItem, layout.views.detail)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertEqual(constraint.secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(constraint.secondAttribute, .width)
        XCTAssertEqual(constraint.priority, .defaultLow)
        XCTAssertEqual(constraint.multiplier, 1.5)
        XCTAssertEqual(constraint.constant, 80)
    }
    
    func test_dimension_lessThanOrEqual() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.width <= \.subtitleLabel.anchors.width
        }
        
        XCTAssertEqual(layout.constraints.count, 1)
        
        let constraint = try XCTUnwrap(layout.constraints.first)
        
        XCTAssertEqual(constraint.firstItem, layout.views.detail)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertEqual(constraint.secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(constraint.secondAttribute, .width)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
    }
    
    func test_dimension_lessThanOrEqual_modified() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.width <= \.subtitleLabel.anchors.width
                ~ .priority(.defaultLow)
                ~ .offset(by: 80)
                ~ .multiplied(by: 1.5)
        }
        
        XCTAssertEqual(layout.constraints.count, 1)
        
        let constraint = try XCTUnwrap(layout.constraints.first)
        
        XCTAssertEqual(constraint.firstItem, layout.views.detail)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertEqual(constraint.secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(constraint.secondAttribute, .width)
        XCTAssertEqual(constraint.priority, .defaultLow)
        XCTAssertEqual(constraint.multiplier, 1.5)
        XCTAssertEqual(constraint.constant, 80)
    }
    
    func test_dimension_greaterThanOrEqual() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.width >= \.subtitleLabel.anchors.width
        }
        
        XCTAssertEqual(layout.constraints.count, 1)
        
        let constraint = try XCTUnwrap(layout.constraints.first)
        
        XCTAssertEqual(constraint.firstItem, layout.views.detail)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertEqual(constraint.secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(constraint.secondAttribute, .width)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
    }
    
    func test_dimension_greaterThanOrEqual_modified() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.width >= \.subtitleLabel.anchors.width
                ~ .priority(.defaultLow)
                ~ .offset(by: 80)
                ~ .multiplied(by: 1.5)
        }
        
        XCTAssertEqual(layout.constraints.count, 1)
        
        let constraint = try XCTUnwrap(layout.constraints.first)
        
        XCTAssertEqual(constraint.firstItem, layout.views.detail)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertEqual(constraint.secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(constraint.secondAttribute, .width)
        XCTAssertEqual(constraint.priority, .defaultLow)
        XCTAssertEqual(constraint.multiplier, 1.5)
        XCTAssertEqual(constraint.constant, 80)
    }
}
