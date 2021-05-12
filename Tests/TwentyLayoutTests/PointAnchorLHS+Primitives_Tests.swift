//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import XCTest

class PointAnchorLHS_Primitives_Tests: XCTestCase {
    
    func test_equal() throws {
        let layout = makeConstraints { views in
            views.image.anchors.top.left == 20
        }
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
        XCTAssertEqual(layout.constraints[0].relation, .equal)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 20)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .left)
        XCTAssertEqual(layout.constraints[1].relation, .equal)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .left)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 20)
    }
    
    func test_equal_modified() throws {
        let layout = makeConstraints { views in
            views.image.anchors.top.left == 20
                ~ .priority(.defaultLow)
        }
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
        XCTAssertEqual(layout.constraints[0].relation, .equal)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
        XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 20)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .left)
        XCTAssertEqual(layout.constraints[1].relation, .equal)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .left)
        XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 20)
    }
    
    func test_lessThanOrEqual() throws {
        let layout = makeConstraints { views in
            views.image.anchors.top.left <= 20
        }
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
        XCTAssertEqual(layout.constraints[0].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 20)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .left)
        XCTAssertEqual(layout.constraints[1].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .left)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 20)
    }
    
    func test_lessThanOrEqual_modified() throws {
        let layout = makeConstraints { views in
            views.image.anchors.top.left <= 20
                ~ .priority(.defaultLow)
        }
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
        XCTAssertEqual(layout.constraints[0].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
        XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 20)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .left)
        XCTAssertEqual(layout.constraints[1].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .left)
        XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 20)
    }
    
    func test_greaterThanOrEqual() throws {
        let layout = makeConstraints { views in
            views.image.anchors.top.left >= 20
        }
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
        XCTAssertEqual(layout.constraints[0].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 20)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .left)
        XCTAssertEqual(layout.constraints[1].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .left)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 20)
    }
    
    func test_greaterThanOrEqual_modified() throws {
        let layout = makeConstraints { views in
            views.image.anchors.top.left >= 20
                ~ .priority(.defaultLow)
        }
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
        XCTAssertEqual(layout.constraints[0].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
        XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 20)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .left)
        XCTAssertEqual(layout.constraints[1].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .left)
        XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 20)
    }
    
    func test_equal_point() throws {
        let layout = makeConstraints { views in
            views.image.anchors.top.left == CGPoint(x: 40, y: 60)
        }
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
        XCTAssertEqual(layout.constraints[0].relation, .equal)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 60)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .left)
        XCTAssertEqual(layout.constraints[1].relation, .equal)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .left)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 40)
    }

    func test_equal_point_modified() throws {
        let layout = makeConstraints { views in
            views.image.anchors.center == CGPoint(x: 40, y: 60)
        }
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .centerY)
        XCTAssertEqual(layout.constraints[0].relation, .equal)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .centerY)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 60)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .centerX)
        XCTAssertEqual(layout.constraints[1].relation, .equal)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .centerX)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 40)
    }
    
    func test_lessThanOrEqual_point() throws {
        let layout = makeConstraints { views in
            views.image.anchors.top.left <= CGPoint(x: 40, y: 60)
        }
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
        XCTAssertEqual(layout.constraints[0].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 60)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .left)
        XCTAssertEqual(layout.constraints[1].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .left)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 40)
    }

    func test_lessThanOrEqual_point_modified() throws {
        let layout = makeConstraints { views in
            views.image.anchors.center <= CGPoint(x: 40, y: 60)
        }
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .centerY)
        XCTAssertEqual(layout.constraints[0].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .centerY)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 60)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .centerX)
        XCTAssertEqual(layout.constraints[1].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .centerX)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 40)
    }

    func test_greaterThanOrEqual_point() throws {
        let layout = makeConstraints { views in
            views.image.anchors.top.left >= CGPoint(x: 40, y: 60)
        }
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
        XCTAssertEqual(layout.constraints[0].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 60)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .left)
        XCTAssertEqual(layout.constraints[1].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .left)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 40)
    }

    func test_greaterThanOrEqual_point_modified() throws {
        let layout = makeConstraints { views in
            views.image.anchors.center >= CGPoint(x: 40, y: 60)
        }
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .centerY)
        XCTAssertEqual(layout.constraints[0].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .centerY)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 60)
        
        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .centerX)
        XCTAssertEqual(layout.constraints[1].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .centerX)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 40)
    }

}
