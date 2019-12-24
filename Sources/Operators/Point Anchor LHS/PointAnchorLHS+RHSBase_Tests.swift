//
//  Created by Jérôme Alves on 20/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

class PointAnchorLHS_RHSBase_Tests: XCTestCase {
    
     // MARK: - Equal
         
        func test_equal() throws {
            let layout = makeConstraints { views in
                views.image.anchors.bottom.leading == views.detail.subtitleLabel
            }
            
            XCTAssertEqual(layout.constraints.count, 2)
            
            guard layout.constraints.count == 2 else {
                return XCTFail()
            }
            
            XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
            XCTAssertEqual(layout.constraints[0].firstAttribute, .bottom)
            XCTAssertEqual(layout.constraints[0].relation, .equal)
            XCTAssertEqual(layout.constraints[0].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[0].secondAttribute, .bottom)
            XCTAssertEqual(layout.constraints[0].priority, .required)
            XCTAssertEqual(layout.constraints[0].multiplier, 1)
            XCTAssertEqual(layout.constraints[0].constant, 0)

            XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
            XCTAssertEqual(layout.constraints[1].firstAttribute, .leading)
            XCTAssertEqual(layout.constraints[1].relation, .equal)
            XCTAssertEqual(layout.constraints[1].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[1].secondAttribute, .leading)
            XCTAssertEqual(layout.constraints[1].priority, .required)
            XCTAssertEqual(layout.constraints[1].multiplier, 1)
            XCTAssertEqual(layout.constraints[1].constant, 0)
        }
        
        func test_equal_modified() throws {
            let layout = makeConstraints { views in
                views.image.anchors.firstBaseline.trailing == views.detail.subtitleLabel
                    ~ .priority(.defaultLow)
                    ~ .inset(by: 80)
                    ~ .multiplied(by: 1.5)
            }
            
            XCTAssertEqual(layout.constraints.count, 2)
            
            guard layout.constraints.count == 2 else {
                return XCTFail()
            }
            
            XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
            XCTAssertEqual(layout.constraints[0].firstAttribute, .firstBaseline)
            XCTAssertEqual(layout.constraints[0].relation, .equal)
            XCTAssertEqual(layout.constraints[0].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[0].secondAttribute, .firstBaseline)
            XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[0].multiplier, 1.5)
            XCTAssertEqual(layout.constraints[0].constant, 0)

            XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
            XCTAssertEqual(layout.constraints[1].firstAttribute, .trailing)
            XCTAssertEqual(layout.constraints[1].relation, .equal)
            XCTAssertEqual(layout.constraints[1].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[1].secondAttribute, .trailing)
            XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[1].multiplier, 1.5)
            XCTAssertEqual(layout.constraints[1].constant, -80)
        }
    
        // MARK: - Less Than Or Equal
         
        func test_lessThanOrEqual() throws {
            let layout = makeConstraints { views in
                views.image.anchors.lastBaseline.centerX <= views.detail.subtitleLabel
            }
            
            XCTAssertEqual(layout.constraints.count, 2)
            
            guard layout.constraints.count == 2 else {
                return XCTFail()
            }
            
            XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
            XCTAssertEqual(layout.constraints[0].firstAttribute, .lastBaseline)
            XCTAssertEqual(layout.constraints[0].relation, .lessThanOrEqual)
            XCTAssertEqual(layout.constraints[0].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[0].secondAttribute, .lastBaseline)
            XCTAssertEqual(layout.constraints[0].priority, .required)
            XCTAssertEqual(layout.constraints[0].multiplier, 1)
            XCTAssertEqual(layout.constraints[0].constant, 0)

            XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
            XCTAssertEqual(layout.constraints[1].firstAttribute, .centerX)
            XCTAssertEqual(layout.constraints[1].relation, .lessThanOrEqual)
            XCTAssertEqual(layout.constraints[1].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[1].secondAttribute, .centerX)
            XCTAssertEqual(layout.constraints[1].priority, .required)
            XCTAssertEqual(layout.constraints[1].multiplier, 1)
            XCTAssertEqual(layout.constraints[1].constant, 0)
        }
        
        func test_lessThanOrEqual_modified() throws {
            let layout = makeConstraints { views in
                views.image.anchors.center <= views.detail.subtitleLabel
                    ~ .priority(.defaultLow)
                    ~ .inset(by: 80)
                    ~ .multiplied(by: 1.5)
            }
            
            XCTAssertEqual(layout.constraints.count, 2)
            
            guard layout.constraints.count == 2 else {
                return XCTFail()
            }
            
            XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
            XCTAssertEqual(layout.constraints[0].firstAttribute, .centerY)
            XCTAssertEqual(layout.constraints[0].relation, .lessThanOrEqual)
            XCTAssertEqual(layout.constraints[0].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[0].secondAttribute, .centerY)
            XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[0].multiplier, 1.5)
            XCTAssertEqual(layout.constraints[0].constant, 0)

            XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
            XCTAssertEqual(layout.constraints[1].firstAttribute, .centerX)
            XCTAssertEqual(layout.constraints[1].relation, .lessThanOrEqual)
            XCTAssertEqual(layout.constraints[1].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[1].secondAttribute, .centerX)
            XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[1].multiplier, 1.5)
            XCTAssertEqual(layout.constraints[1].constant, 0)
        }


    // MARK: - Greater Than Or Equal
     
    func test_greaterThanOrEqual() throws {
        let layout = makeConstraints { views in
            views.image.anchors.topMargin.leftMargin >= views.detail.subtitleLabel
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .topMargin)
        XCTAssertEqual(layout.constraints[0].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .topMargin)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 0)

        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .leftMargin)
        XCTAssertEqual(layout.constraints[1].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .leftMargin)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 0)
    }
    
    func test_greaterThanOrEqual_modified() throws {
        let layout = makeConstraints { views in
            views.image.anchors.bottomMargin.rightMargin >= views.detail.subtitleLabel
                ~ .priority(.defaultLow)
                ~ .inset(by: 80)
                ~ .multiplied(by: 1.5)
        }
        
        XCTAssertEqual(layout.constraints.count, 2)
        
        guard layout.constraints.count == 2 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .bottomMargin)
        XCTAssertEqual(layout.constraints[0].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .bottomMargin)
        XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[0].multiplier, 1.5)
        XCTAssertEqual(layout.constraints[0].constant, -80)

        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.image)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .rightMargin)
        XCTAssertEqual(layout.constraints[1].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .rightMargin)
        XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[1].multiplier, 1.5)
        XCTAssertEqual(layout.constraints[1].constant, -80)
    }
}

