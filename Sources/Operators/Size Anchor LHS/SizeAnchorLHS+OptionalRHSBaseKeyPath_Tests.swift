//
//  Created by Jérôme Alves on 20/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

class SizeAnchorLHS_OptionalRHSBaseKeyPath_Tests: XCTestCase {
        
    // MARK: - Equal
    
    func test_equal() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.size == \.superview
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .width)
        XCTAssertEqual(layout.constraints[0].relation, .equal)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .width)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 0)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .height)
        XCTAssertEqual(layout.constraints[1].relation, .equal)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .height)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 0)
    }
    
    func test_equal_modified() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.size == \.superview
                ~ .priority(.defaultLow)
                ~ .offset(by: 80)
                ~ .multiplied(by: 1.5)
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .width)
        XCTAssertEqual(layout.constraints[0].relation, .equal)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .width)
        XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[0].multiplier, 1.5)
        XCTAssertEqual(layout.constraints[0].constant, 80)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .height)
        XCTAssertEqual(layout.constraints[1].relation, .equal)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .height)
        XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[1].multiplier, 1.5)
        XCTAssertEqual(layout.constraints[1].constant, 80)
    }
    
    // MARK: - Less Than Or Equal
    
    func test_lessThanOrEqual() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.size <= \.superview
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .width)
        XCTAssertEqual(layout.constraints[0].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .width)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 0)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .height)
        XCTAssertEqual(layout.constraints[1].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .height)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 0)
    }
    
    func test_lessThanOrEqual_modified() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.size <= \.superview
                ~ .priority(.defaultLow)
                ~ .offset(by: 80)
                ~ .multiplied(by: 1.5)
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .width)
        XCTAssertEqual(layout.constraints[0].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .width)
        XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[0].multiplier, 1.5)
        XCTAssertEqual(layout.constraints[0].constant, 80)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .height)
        XCTAssertEqual(layout.constraints[1].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .height)
        XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[1].multiplier, 1.5)
        XCTAssertEqual(layout.constraints[1].constant, 80)
    }
    
    
    // MARK: - Greater Than Or Equal
    
    func test_greaterThanOrEqual() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.size >= \.superview
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .width)
        XCTAssertEqual(layout.constraints[0].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .width)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 0)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .height)
        XCTAssertEqual(layout.constraints[1].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .height)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 0)
    }
    
    func test_greaterThanOrEqual_modified() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.size >= \.superview
                ~ .priority(.defaultLow)
                ~ .offset(by: 80)
                ~ .multiplied(by: 1.5)
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .width)
        XCTAssertEqual(layout.constraints[0].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .width)
        XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[0].multiplier, 1.5)
        XCTAssertEqual(layout.constraints[0].constant, 80)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .height)
        XCTAssertEqual(layout.constraints[1].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .height)
        XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[1].multiplier, 1.5)
        XCTAssertEqual(layout.constraints[1].constant, 80)
    }
    

}

