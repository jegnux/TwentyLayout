//
//  Created by Jérôme Alves on 20/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

class SizeAnchorLHS_Primitives_Tests: XCTestCase {
    
    // MARK: - Equal
    
    func test_equal() throws {
        let layout = makeConstraints { views in
            views.detail.titleLabel.anchors.size == 200
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .width)
        XCTAssertEqual(layout.constraints[0].relation, .equal)
        XCTAssertNil(layout.constraints[0].secondItem)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 200)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .height)
        XCTAssertEqual(layout.constraints[1].relation, .equal)
        XCTAssertNil(layout.constraints[1].secondItem)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 200)
    }
    
    func test_equal_modified() throws {
        let layout = makeConstraints { views in
            views.detail.titleLabel.anchors.size == 200
                ~ .priority(.defaultLow)
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .width)
        XCTAssertEqual(layout.constraints[0].relation, .equal)
        XCTAssertNil(layout.constraints[0].secondItem)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 200)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .height)
        XCTAssertEqual(layout.constraints[1].relation, .equal)
        XCTAssertNil(layout.constraints[1].secondItem)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 200)
    }
    
    // MARK: - Less Than Or Equal
    
    func test_lessThanOrEqual() throws {
        let layout = makeConstraints { views in
            views.detail.titleLabel.anchors.size <= 200
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .width)
        XCTAssertEqual(layout.constraints[0].relation, .lessThanOrEqual)
        XCTAssertNil(layout.constraints[0].secondItem)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 200)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .height)
        XCTAssertEqual(layout.constraints[1].relation, .lessThanOrEqual)
        XCTAssertNil(layout.constraints[1].secondItem)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 200)
    }
    
    func test_lessThanOrEqual_modified() throws {
        let layout = makeConstraints { views in
            views.detail.titleLabel.anchors.size <= 200
                ~ .priority(.defaultLow)
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .width)
        XCTAssertEqual(layout.constraints[0].relation, .lessThanOrEqual)
        XCTAssertNil(layout.constraints[0].secondItem)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 200)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .height)
        XCTAssertEqual(layout.constraints[1].relation, .lessThanOrEqual)
        XCTAssertNil(layout.constraints[1].secondItem)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 200)
    }
    
    
    // MARK: - Greater Than Or Equal
    
    func test_greaterThanOrEqual() throws {
        let layout = makeConstraints { views in
            views.detail.titleLabel.anchors.size >= 200
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .width)
        XCTAssertEqual(layout.constraints[0].relation, .greaterThanOrEqual)
        XCTAssertNil(layout.constraints[0].secondItem)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 200)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .height)
        XCTAssertEqual(layout.constraints[1].relation, .greaterThanOrEqual)
        XCTAssertNil(layout.constraints[0].secondItem)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 200)
    }
    
    func test_greaterThanOrEqual_modified() throws {
        let layout = makeConstraints { views in
            views.detail.titleLabel.anchors.size >= 200
                ~ .priority(.defaultLow)
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .width)
        XCTAssertEqual(layout.constraints[0].relation, .greaterThanOrEqual)
        XCTAssertNil(layout.constraints[0].secondItem)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 200)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .height)
        XCTAssertEqual(layout.constraints[1].relation, .greaterThanOrEqual)
        XCTAssertNil(layout.constraints[1].secondItem)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 200)
    }
    
    func test_equal_size() throws {
        let layout = makeConstraints { views in
            views.detail.titleLabel.anchors.size == CGSize(width: 400, height: 600)
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .width)
        XCTAssertEqual(layout.constraints[0].relation, .equal)
        XCTAssertNil(layout.constraints[0].secondItem)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 400)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .height)
        XCTAssertEqual(layout.constraints[1].relation, .equal)
        XCTAssertNil(layout.constraints[1].secondItem)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 600)
    }
    
    func test_equal_modified_size() throws {
        let layout = makeConstraints { views in
            views.detail.titleLabel.anchors.size == CGSize(width: 400, height: 600)
                ~ .priority(.defaultLow)
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .width)
        XCTAssertEqual(layout.constraints[0].relation, .equal)
        XCTAssertNil(layout.constraints[0].secondItem)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 400)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .height)
        XCTAssertEqual(layout.constraints[1].relation, .equal)
        XCTAssertNil(layout.constraints[1].secondItem)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 600)
    }
    
    // MARK: - Less Than Or Equal
    
    func test_lessThanOrEqual_size() throws {
        let layout = makeConstraints { views in
            views.detail.titleLabel.anchors.size <= CGSize(width: 400, height: 600)
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .width)
        XCTAssertEqual(layout.constraints[0].relation, .lessThanOrEqual)
        XCTAssertNil(layout.constraints[0].secondItem)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 400)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .height)
        XCTAssertEqual(layout.constraints[1].relation, .lessThanOrEqual)
        XCTAssertNil(layout.constraints[1].secondItem)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 600)
    }
    
    func test_lessThanOrEqual_size_modified() throws {
        let layout = makeConstraints { views in
            views.detail.titleLabel.anchors.size <= CGSize(width: 400, height: 600)
                ~ .priority(.defaultLow)
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .width)
        XCTAssertEqual(layout.constraints[0].relation, .lessThanOrEqual)
        XCTAssertNil(layout.constraints[0].secondItem)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 400)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .height)
        XCTAssertEqual(layout.constraints[1].relation, .lessThanOrEqual)
        XCTAssertNil(layout.constraints[1].secondItem)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 600)
    }
    
    
    // MARK: - Greater Than Or Equal
    
    func test_greaterThanOrEqual_size() throws {
        let layout = makeConstraints { views in
            views.detail.titleLabel.anchors.size >= CGSize(width: 400, height: 600)
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .width)
        XCTAssertEqual(layout.constraints[0].relation, .greaterThanOrEqual)
        XCTAssertNil(layout.constraints[0].secondItem)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 400)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .height)
        XCTAssertEqual(layout.constraints[1].relation, .greaterThanOrEqual)
        XCTAssertNil(layout.constraints[0].secondItem)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 600)
    }
    
    func test_greaterThanOrEqual_size_modified() throws {
        let layout = makeConstraints { views in
            views.detail.titleLabel.anchors.size >= CGSize(width: 400, height: 600)
                ~ .priority(.defaultLow)
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .width)
        XCTAssertEqual(layout.constraints[0].relation, .greaterThanOrEqual)
        XCTAssertNil(layout.constraints[0].secondItem)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 400)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .height)
        XCTAssertEqual(layout.constraints[1].relation, .greaterThanOrEqual)
        XCTAssertNil(layout.constraints[1].secondItem)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 600)
    }
    
}

