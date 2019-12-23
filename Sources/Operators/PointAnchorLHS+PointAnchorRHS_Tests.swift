//
//  Created by Jérôme Alves on 20/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

class PointAnchorLHS_PointAnchorRHS_Tests: XCTestCase {
    
     // MARK: - Equal
         
        func test_equal() throws {
            let layout = makeConstraints { views in
                views.image.anchors.bottom.left == views.detail.subtitleLabel.anchors.top.right
            }
            
            XCTAssertEqual(layout.constraints.count, 2)
            
            guard layout.constraints.count == 2 else {
                return XCTFail()
            }
            
            XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
            XCTAssertEqual(layout.constraints[0].firstAttribute, .bottom)
            XCTAssertEqual(layout.constraints[0].relation, .equal)
            XCTAssertEqual(layout.constraints[0].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
            XCTAssertEqual(layout.constraints[0].priority, .required)
            XCTAssertEqual(layout.constraints[0].multiplier, 1)
            XCTAssertEqual(layout.constraints[0].constant, 0)

            XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
            XCTAssertEqual(layout.constraints[1].firstAttribute, .left)
            XCTAssertEqual(layout.constraints[1].relation, .equal)
            XCTAssertEqual(layout.constraints[1].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[1].secondAttribute, .right)
            XCTAssertEqual(layout.constraints[1].priority, .required)
            XCTAssertEqual(layout.constraints[1].multiplier, 1)
            XCTAssertEqual(layout.constraints[1].constant, 0)
        }
        
        func test_equal_modified() throws {
            let layout = makeConstraints { views in
                views.image.anchors.top.left == views.detail.subtitleLabel.anchors.top.right
                    ~ .priority(.defaultLow)
                    ~ .inset(by: 80)
                    ~ .multiplied(by: 1.5)
            }
            
            XCTAssertEqual(layout.constraints.count, 2)
            
            guard layout.constraints.count == 2 else {
                return XCTFail()
            }
            
            XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
            XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
            XCTAssertEqual(layout.constraints[0].relation, .equal)
            XCTAssertEqual(layout.constraints[0].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
            XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[0].multiplier, 1.5)
            XCTAssertEqual(layout.constraints[0].constant, 80)

            XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
            XCTAssertEqual(layout.constraints[1].firstAttribute, .left)
            XCTAssertEqual(layout.constraints[1].relation, .equal)
            XCTAssertEqual(layout.constraints[1].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[1].secondAttribute, .right)
            XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[1].multiplier, 1.5)
            XCTAssertEqual(layout.constraints[1].constant, -80)
        }
    
        // MARK: - Less Than Or Equal
         
        func test_lessThanOrEqual() throws {
            let layout = makeConstraints { views in
                views.image.anchors.bottom.left <= views.detail.subtitleLabel.anchors.top.right
            }
            
            XCTAssertEqual(layout.constraints.count, 2)
            
            guard layout.constraints.count == 2 else {
                return XCTFail()
            }
            
            XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
            XCTAssertEqual(layout.constraints[0].firstAttribute, .bottom)
            XCTAssertEqual(layout.constraints[0].relation, .lessThanOrEqual)
            XCTAssertEqual(layout.constraints[0].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
            XCTAssertEqual(layout.constraints[0].priority, .required)
            XCTAssertEqual(layout.constraints[0].multiplier, 1)
            XCTAssertEqual(layout.constraints[0].constant, 0)

            XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
            XCTAssertEqual(layout.constraints[1].firstAttribute, .left)
            XCTAssertEqual(layout.constraints[1].relation, .lessThanOrEqual)
            XCTAssertEqual(layout.constraints[1].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[1].secondAttribute, .right)
            XCTAssertEqual(layout.constraints[1].priority, .required)
            XCTAssertEqual(layout.constraints[1].multiplier, 1)
            XCTAssertEqual(layout.constraints[1].constant, 0)
        }
        
        func test_lessThanOrEqual_modified() throws {
            let layout = makeConstraints { views in
                views.image.anchors.top.left <= views.detail.subtitleLabel.anchors.top.right
                    ~ .priority(.defaultLow)
                    ~ .inset(by: 80)
                    ~ .multiplied(by: 1.5)
            }
            
            XCTAssertEqual(layout.constraints.count, 2)
            
            guard layout.constraints.count == 2 else {
                return XCTFail()
            }
            
            XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
            XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
            XCTAssertEqual(layout.constraints[0].relation, .lessThanOrEqual)
            XCTAssertEqual(layout.constraints[0].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
            XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[0].multiplier, 1.5)
            XCTAssertEqual(layout.constraints[0].constant, 80)

            XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
            XCTAssertEqual(layout.constraints[1].firstAttribute, .left)
            XCTAssertEqual(layout.constraints[1].relation, .lessThanOrEqual)
            XCTAssertEqual(layout.constraints[1].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[1].secondAttribute, .right)
            XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[1].multiplier, 1.5)
            XCTAssertEqual(layout.constraints[1].constant, -80)
        }


    // MARK: - Greater Than Or Equal
     
    func test_greaterThanOrEqual() throws {
        let layout = makeConstraints { views in
            views.image.anchors.bottom.left >= views.detail.subtitleLabel.anchors.top.right
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .bottom)
        XCTAssertEqual(layout.constraints[0].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 0)

        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .left)
        XCTAssertEqual(layout.constraints[1].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .right)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 0)
    }
    
    func test_greaterThanOrEqual_modified() throws {
        let layout = makeConstraints { views in
            views.image.anchors.top.left >= views.detail.subtitleLabel.anchors.top.right
                ~ .priority(.defaultLow)
                ~ .inset(by: 80)
                ~ .multiplied(by: 1.5)
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
        XCTAssertEqual(layout.constraints[0].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .top)
        XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[0].multiplier, 1.5)
        XCTAssertEqual(layout.constraints[0].constant, 80)

        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .left)
        XCTAssertEqual(layout.constraints[1].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .right)
        XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[1].multiplier, 1.5)
        XCTAssertEqual(layout.constraints[1].constant, -80)
    }
}

