//
//  Created by Jérôme Alves on 20/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

class EdgesAnchorLHS_Primitives_Tests: XCTestCase {
    
     // MARK: - Equal
         
        func test_equal() throws {
            let layout = makeConstraints { views in
                views.detail.anchors.edges == .inset(by: 40)
            }
            
            guard layout.constraints.count == 4 else {
                return XCTFail()
            }
            
            XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail)
            XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
            XCTAssertEqual(layout.constraints[0].relation, .equal)
            XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
            XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
            XCTAssertEqual(layout.constraints[0].priority, .required)
            XCTAssertEqual(layout.constraints[0].multiplier, 1)
            XCTAssertEqual(layout.constraints[0].constant, 40)

            XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail)
            XCTAssertEqual(layout.constraints[1].firstAttribute, .bottom)
            XCTAssertEqual(layout.constraints[1].relation, .equal)
            XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
            XCTAssertEqual(layout.constraints[1].secondAttribute, .bottom)
            XCTAssertEqual(layout.constraints[1].priority, .required)
            XCTAssertEqual(layout.constraints[1].multiplier, 1)
            XCTAssertEqual(layout.constraints[1].constant, -40)
            
            XCTAssertEqual(layout.constraints[2].firstItem, layout.views.detail)
            XCTAssertEqual(layout.constraints[2].firstAttribute, .left)
            XCTAssertEqual(layout.constraints[2].relation, .equal)
            XCTAssertEqual(layout.constraints[2].secondItem, layout.views.container)
            XCTAssertEqual(layout.constraints[2].secondAttribute, .left)
            XCTAssertEqual(layout.constraints[2].priority, .required)
            XCTAssertEqual(layout.constraints[2].multiplier, 1)
            XCTAssertEqual(layout.constraints[2].constant, 40)
            
            XCTAssertEqual(layout.constraints[3].firstItem, layout.views.detail)
            XCTAssertEqual(layout.constraints[3].firstAttribute, .right)
            XCTAssertEqual(layout.constraints[3].relation, .equal)
            XCTAssertEqual(layout.constraints[3].secondItem, layout.views.container)
            XCTAssertEqual(layout.constraints[3].secondAttribute, .right)
            XCTAssertEqual(layout.constraints[3].priority, .required)
            XCTAssertEqual(layout.constraints[3].multiplier, 1)
            XCTAssertEqual(layout.constraints[3].constant, -40)
        }

        func test_equal_modified() throws {
            let layout = makeConstraints { views in
                views.detail.anchors.edges == .offset(by: 40)
                    ~ .priority(.defaultLow)
            }
            
            
            guard layout.constraints.count == 4 else {
                return XCTFail()
            }
            
            XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail)
            XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
            XCTAssertEqual(layout.constraints[0].relation, .equal)
            XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
            XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
            XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[0].multiplier, 1)
            XCTAssertEqual(layout.constraints[0].constant, 40)

            XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail)
            XCTAssertEqual(layout.constraints[1].firstAttribute, .bottom)
            XCTAssertEqual(layout.constraints[1].relation, .equal)
            XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
            XCTAssertEqual(layout.constraints[1].secondAttribute, .bottom)
            XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[1].multiplier, 1)
            XCTAssertEqual(layout.constraints[1].constant, 40)
            
            XCTAssertEqual(layout.constraints[2].firstItem, layout.views.detail)
            XCTAssertEqual(layout.constraints[2].firstAttribute, .left)
            XCTAssertEqual(layout.constraints[2].relation, .equal)
            XCTAssertEqual(layout.constraints[2].secondItem, layout.views.container)
            XCTAssertEqual(layout.constraints[2].secondAttribute, .left)
            XCTAssertEqual(layout.constraints[2].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[2].multiplier, 1)
            XCTAssertEqual(layout.constraints[2].constant, 40)
            
            XCTAssertEqual(layout.constraints[3].firstItem, layout.views.detail)
            XCTAssertEqual(layout.constraints[3].firstAttribute, .right)
            XCTAssertEqual(layout.constraints[3].relation, .equal)
            XCTAssertEqual(layout.constraints[3].secondItem, layout.views.container)
            XCTAssertEqual(layout.constraints[3].secondAttribute, .right)
            XCTAssertEqual(layout.constraints[3].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[3].multiplier, 1)
            XCTAssertEqual(layout.constraints[3].constant, 40)
        }

        // MARK: - Less Than Or Equal
         
        func test_lessThanOrEqual() throws {
            let layout = makeConstraints { views in
                views.detail.anchors.edges <= .inset(by: 40)
            }
            
            guard layout.constraints.count == 4 else {
                return XCTFail()
            }
            
            XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail)
            XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
            XCTAssertEqual(layout.constraints[0].relation, .greaterThanOrEqual)
            XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
            XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
            XCTAssertEqual(layout.constraints[0].priority, .required)
            XCTAssertEqual(layout.constraints[0].multiplier, 1)
            XCTAssertEqual(layout.constraints[0].constant, 40)

            XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail)
            XCTAssertEqual(layout.constraints[1].firstAttribute, .bottom)
            XCTAssertEqual(layout.constraints[1].relation, .lessThanOrEqual)
            XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
            XCTAssertEqual(layout.constraints[1].secondAttribute, .bottom)
            XCTAssertEqual(layout.constraints[1].priority, .required)
            XCTAssertEqual(layout.constraints[1].multiplier, 1)
            XCTAssertEqual(layout.constraints[1].constant, -40)
            
            XCTAssertEqual(layout.constraints[2].firstItem, layout.views.detail)
            XCTAssertEqual(layout.constraints[2].firstAttribute, .left)
            XCTAssertEqual(layout.constraints[2].relation, .greaterThanOrEqual)
            XCTAssertEqual(layout.constraints[2].secondItem, layout.views.container)
            XCTAssertEqual(layout.constraints[2].secondAttribute, .left)
            XCTAssertEqual(layout.constraints[2].priority, .required)
            XCTAssertEqual(layout.constraints[2].multiplier, 1)
            XCTAssertEqual(layout.constraints[2].constant, 40)
            
            XCTAssertEqual(layout.constraints[3].firstItem, layout.views.detail)
            XCTAssertEqual(layout.constraints[3].firstAttribute, .right)
            XCTAssertEqual(layout.constraints[3].relation, .lessThanOrEqual)
            XCTAssertEqual(layout.constraints[3].secondItem, layout.views.container)
            XCTAssertEqual(layout.constraints[3].secondAttribute, .right)
            XCTAssertEqual(layout.constraints[3].priority, .required)
            XCTAssertEqual(layout.constraints[3].multiplier, 1)
            XCTAssertEqual(layout.constraints[3].constant, -40)
        }

        func test_lessThanOrEqual_modified() throws {
            let layout = makeConstraints { views in
                views.detail.anchors.edges <= .offset(by: 40)
                    ~ .priority(.defaultLow)
            }
            
            
            guard layout.constraints.count == 4 else {
                return XCTFail()
            }
            
            XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail)
            XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
            XCTAssertEqual(layout.constraints[0].relation, .greaterThanOrEqual)
            XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
            XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
            XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[0].multiplier, 1)
            XCTAssertEqual(layout.constraints[0].constant, 40)

            XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail)
            XCTAssertEqual(layout.constraints[1].firstAttribute, .bottom)
            XCTAssertEqual(layout.constraints[1].relation, .lessThanOrEqual)
            XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
            XCTAssertEqual(layout.constraints[1].secondAttribute, .bottom)
            XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[1].multiplier, 1)
            XCTAssertEqual(layout.constraints[1].constant, 40)
            
            XCTAssertEqual(layout.constraints[2].firstItem, layout.views.detail)
            XCTAssertEqual(layout.constraints[2].firstAttribute, .left)
            XCTAssertEqual(layout.constraints[2].relation, .greaterThanOrEqual)
            XCTAssertEqual(layout.constraints[2].secondItem, layout.views.container)
            XCTAssertEqual(layout.constraints[2].secondAttribute, .left)
            XCTAssertEqual(layout.constraints[2].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[2].multiplier, 1)
            XCTAssertEqual(layout.constraints[2].constant, 40)
            
            XCTAssertEqual(layout.constraints[3].firstItem, layout.views.detail)
            XCTAssertEqual(layout.constraints[3].firstAttribute, .right)
            XCTAssertEqual(layout.constraints[3].relation, .lessThanOrEqual)
            XCTAssertEqual(layout.constraints[3].secondItem, layout.views.container)
            XCTAssertEqual(layout.constraints[3].secondAttribute, .right)
            XCTAssertEqual(layout.constraints[3].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[3].multiplier, 1)
            XCTAssertEqual(layout.constraints[3].constant, 40)
        }

    // MARK: - Greater Than Or Equal
     
    func test_greaterThanOrEqual() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.edges >= .inset(by: 40)
        }
        
        guard layout.constraints.count == 4 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
        XCTAssertEqual(layout.constraints[0].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 40)

        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .bottom)
        XCTAssertEqual(layout.constraints[1].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .bottom)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, -40)
        
        XCTAssertEqual(layout.constraints[2].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[2].firstAttribute, .left)
        XCTAssertEqual(layout.constraints[2].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[2].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[2].secondAttribute, .left)
        XCTAssertEqual(layout.constraints[2].priority, .required)
        XCTAssertEqual(layout.constraints[2].multiplier, 1)
        XCTAssertEqual(layout.constraints[2].constant, 40)
        
        XCTAssertEqual(layout.constraints[3].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[3].firstAttribute, .right)
        XCTAssertEqual(layout.constraints[3].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[3].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[3].secondAttribute, .right)
        XCTAssertEqual(layout.constraints[3].priority, .required)
        XCTAssertEqual(layout.constraints[3].multiplier, 1)
        XCTAssertEqual(layout.constraints[3].constant, -40)
    }

    func test_greaterThanOrEqual_modified() throws {
        let layout = makeConstraints { views in
            views.detail.anchors.edges >= .offset(by: 40)
                ~ .priority(.defaultLow)
        }
        
        
        guard layout.constraints.count == 4 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
        XCTAssertEqual(layout.constraints[0].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
        XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 40)

        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .bottom)
        XCTAssertEqual(layout.constraints[1].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .bottom)
        XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 40)
        
        XCTAssertEqual(layout.constraints[2].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[2].firstAttribute, .left)
        XCTAssertEqual(layout.constraints[2].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[2].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[2].secondAttribute, .left)
        XCTAssertEqual(layout.constraints[2].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[2].multiplier, 1)
        XCTAssertEqual(layout.constraints[2].constant, 40)
        
        XCTAssertEqual(layout.constraints[3].firstItem, layout.views.detail)
        XCTAssertEqual(layout.constraints[3].firstAttribute, .right)
        XCTAssertEqual(layout.constraints[3].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[3].secondItem, layout.views.container)
        XCTAssertEqual(layout.constraints[3].secondAttribute, .right)
        XCTAssertEqual(layout.constraints[3].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[3].multiplier, 1)
        XCTAssertEqual(layout.constraints[3].constant, 40)
    }

}

