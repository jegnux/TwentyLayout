//
//  Created by Jérôme Alves on 20/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

class EdgesAnchorLHS_EdgesAnchorRHS_Tests: XCTestCase {
    
     // MARK: - Equal
         
        func test_equal() throws {
            let layout = makeConstraints { views in
                views.detail.titleLabel.anchors.edges == views.detail.subtitleLabel.anchors.margins
            }
            
            guard layout.constraints.count == 4 else {
                return XCTFail()
            }
            
            XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail.titleLabel)
            XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
            XCTAssertEqual(layout.constraints[0].relation, .equal)
            XCTAssertEqual(layout.constraints[0].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[0].secondAttribute, .topMargin)
            XCTAssertEqual(layout.constraints[0].priority, .required)
            XCTAssertEqual(layout.constraints[0].multiplier, 1)
            XCTAssertEqual(layout.constraints[0].constant, 0)

            XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail.titleLabel)
            XCTAssertEqual(layout.constraints[1].firstAttribute, .bottom)
            XCTAssertEqual(layout.constraints[1].relation, .equal)
            XCTAssertEqual(layout.constraints[1].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[1].secondAttribute, .bottomMargin)
            XCTAssertEqual(layout.constraints[1].priority, .required)
            XCTAssertEqual(layout.constraints[1].multiplier, 1)
            XCTAssertEqual(layout.constraints[1].constant, 0)
            
            XCTAssertEqual(layout.constraints[2].firstItem, layout.views.detail.titleLabel)
            XCTAssertEqual(layout.constraints[2].firstAttribute, .left)
            XCTAssertEqual(layout.constraints[2].relation, .equal)
            XCTAssertEqual(layout.constraints[2].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[2].secondAttribute, .leftMargin)
            XCTAssertEqual(layout.constraints[2].priority, .required)
            XCTAssertEqual(layout.constraints[2].multiplier, 1)
            XCTAssertEqual(layout.constraints[2].constant, 0)
            
            XCTAssertEqual(layout.constraints[3].firstItem, layout.views.detail.titleLabel)
            XCTAssertEqual(layout.constraints[3].firstAttribute, .right)
            XCTAssertEqual(layout.constraints[3].relation, .equal)
            XCTAssertEqual(layout.constraints[3].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[3].secondAttribute, .rightMargin)
            XCTAssertEqual(layout.constraints[3].priority, .required)
            XCTAssertEqual(layout.constraints[3].multiplier, 1)
            XCTAssertEqual(layout.constraints[3].constant, 0)
        }

        func test_equal_modified() throws {
            let layout = makeConstraints { views in
                views.detail.titleLabel.anchors.directionalEdges == views.detail.subtitleLabel.anchors.directionalMargins
                    ~ .priority(.defaultLow)
                    ~ .inset(by: 80)
                    ~ .multiplied(by: 1.5)
            }
            
            
            guard layout.constraints.count == 4 else {
                return XCTFail()
            }
            
            XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail.titleLabel)
            XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
            XCTAssertEqual(layout.constraints[0].relation, .equal)
            XCTAssertEqual(layout.constraints[0].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[0].secondAttribute, .topMargin)
            XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[0].multiplier, 1.5)
            XCTAssertEqual(layout.constraints[0].constant, 80)

            XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail.titleLabel)
            XCTAssertEqual(layout.constraints[1].firstAttribute, .bottom)
            XCTAssertEqual(layout.constraints[1].relation, .equal)
            XCTAssertEqual(layout.constraints[1].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[1].secondAttribute, .bottomMargin)
            XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[1].multiplier, 1.5)
            XCTAssertEqual(layout.constraints[1].constant, -80)
            
            XCTAssertEqual(layout.constraints[2].firstItem, layout.views.detail.titleLabel)
            XCTAssertEqual(layout.constraints[2].firstAttribute, .leading)
            XCTAssertEqual(layout.constraints[2].relation, .equal)
            XCTAssertEqual(layout.constraints[2].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[2].secondAttribute, .leadingMargin)
            XCTAssertEqual(layout.constraints[2].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[2].multiplier, 1.5)
            XCTAssertEqual(layout.constraints[2].constant, 80)
            
            XCTAssertEqual(layout.constraints[3].firstItem, layout.views.detail.titleLabel)
            XCTAssertEqual(layout.constraints[3].firstAttribute, .trailing)
            XCTAssertEqual(layout.constraints[3].relation, .equal)
            XCTAssertEqual(layout.constraints[3].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[3].secondAttribute, .trailingMargin)
            XCTAssertEqual(layout.constraints[3].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[3].multiplier, 1.5)
            XCTAssertEqual(layout.constraints[3].constant, -80)
        }

        // MARK: - Less Than Or Equal
         
        func test_lessThanOrEqual() throws {
            let layout = makeConstraints { views in
                views.detail.titleLabel.anchors.edges <= views.detail.subtitleLabel.anchors.margins
            }
            
            guard layout.constraints.count == 4 else {
                return XCTFail()
            }
            
            XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail.titleLabel)
            XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
            XCTAssertEqual(layout.constraints[0].relation, .greaterThanOrEqual)
            XCTAssertEqual(layout.constraints[0].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[0].secondAttribute, .topMargin)
            XCTAssertEqual(layout.constraints[0].priority, .required)
            XCTAssertEqual(layout.constraints[0].multiplier, 1)
            XCTAssertEqual(layout.constraints[0].constant, 0)

            XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail.titleLabel)
            XCTAssertEqual(layout.constraints[1].firstAttribute, .bottom)
            XCTAssertEqual(layout.constraints[1].relation, .lessThanOrEqual)
            XCTAssertEqual(layout.constraints[1].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[1].secondAttribute, .bottomMargin)
            XCTAssertEqual(layout.constraints[1].priority, .required)
            XCTAssertEqual(layout.constraints[1].multiplier, 1)
            XCTAssertEqual(layout.constraints[1].constant, 0)
            
            XCTAssertEqual(layout.constraints[2].firstItem, layout.views.detail.titleLabel)
            XCTAssertEqual(layout.constraints[2].firstAttribute, .left)
            XCTAssertEqual(layout.constraints[2].relation, .greaterThanOrEqual)
            XCTAssertEqual(layout.constraints[2].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[2].secondAttribute, .leftMargin)
            XCTAssertEqual(layout.constraints[2].priority, .required)
            XCTAssertEqual(layout.constraints[2].multiplier, 1)
            XCTAssertEqual(layout.constraints[2].constant, 0)
            
            XCTAssertEqual(layout.constraints[3].firstItem, layout.views.detail.titleLabel)
            XCTAssertEqual(layout.constraints[3].firstAttribute, .right)
            XCTAssertEqual(layout.constraints[3].relation, .lessThanOrEqual)
            XCTAssertEqual(layout.constraints[3].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[3].secondAttribute, .rightMargin)
            XCTAssertEqual(layout.constraints[3].priority, .required)
            XCTAssertEqual(layout.constraints[3].multiplier, 1)
            XCTAssertEqual(layout.constraints[3].constant, 0)
        }
        
        func test_lessThanOrEqual_modified() throws {
            let layout = makeConstraints { views in
                views.detail.titleLabel.anchors.directionalEdges <= views.detail.subtitleLabel.anchors.directionalMargins
                    ~ .priority(.defaultLow)
                    ~ .offset(by: UIEdgeInsets(top: 12, left: 24, bottom: 36, right: 48))
                    ~ .multiplied(by: 1.5)
            }
            
            
            guard layout.constraints.count == 4 else {
                return XCTFail()
            }
            
            XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail.titleLabel)
            XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
            XCTAssertEqual(layout.constraints[0].relation, .greaterThanOrEqual)
            XCTAssertEqual(layout.constraints[0].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[0].secondAttribute, .topMargin)
            XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[0].multiplier, 1.5)
            XCTAssertEqual(layout.constraints[0].constant, 12)

            XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail.titleLabel)
            XCTAssertEqual(layout.constraints[1].firstAttribute, .bottom)
            XCTAssertEqual(layout.constraints[1].relation, .lessThanOrEqual)
            XCTAssertEqual(layout.constraints[1].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[1].secondAttribute, .bottomMargin)
            XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[1].multiplier, 1.5)
            XCTAssertEqual(layout.constraints[1].constant, 36)
            
            XCTAssertEqual(layout.constraints[2].firstItem, layout.views.detail.titleLabel)
            XCTAssertEqual(layout.constraints[2].firstAttribute, .leading)
            XCTAssertEqual(layout.constraints[2].relation, .greaterThanOrEqual)
            XCTAssertEqual(layout.constraints[2].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[2].secondAttribute, .leadingMargin)
            XCTAssertEqual(layout.constraints[2].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[2].multiplier, 1.5)
            XCTAssertEqual(layout.constraints[2].constant, 24)
            
            XCTAssertEqual(layout.constraints[3].firstItem, layout.views.detail.titleLabel)
            XCTAssertEqual(layout.constraints[3].firstAttribute, .trailing)
            XCTAssertEqual(layout.constraints[3].relation, .lessThanOrEqual)
            XCTAssertEqual(layout.constraints[3].secondItem, layout.views.detail.subtitleLabel)
            XCTAssertEqual(layout.constraints[3].secondAttribute, .trailingMargin)
            XCTAssertEqual(layout.constraints[3].priority, .defaultLow)
            XCTAssertEqual(layout.constraints[3].multiplier, 1.5)
            XCTAssertEqual(layout.constraints[3].constant, 48)
        }

    // MARK: - Greater Than Or Equal
     
    func test_greaterThanOrEqual() throws {
        let layout = makeConstraints { views in
            views.detail.titleLabel.anchors.edges >= views.detail.subtitleLabel.anchors.margins
        }
        
        XCTAssertEqual(layout.constraints.count, 4)
        
        guard layout.constraints.count == 4 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
        XCTAssertEqual(layout.constraints[0].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .topMargin)
        XCTAssertEqual(layout.constraints[0].priority, .required)
        XCTAssertEqual(layout.constraints[0].multiplier, 1)
        XCTAssertEqual(layout.constraints[0].constant, 0)

        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .bottom)
        XCTAssertEqual(layout.constraints[1].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .bottomMargin)
        XCTAssertEqual(layout.constraints[1].priority, .required)
        XCTAssertEqual(layout.constraints[1].multiplier, 1)
        XCTAssertEqual(layout.constraints[1].constant, 0)
        
        XCTAssertEqual(layout.constraints[2].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[2].firstAttribute, .left)
        XCTAssertEqual(layout.constraints[2].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[2].secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(layout.constraints[2].secondAttribute, .leftMargin)
        XCTAssertEqual(layout.constraints[2].priority, .required)
        XCTAssertEqual(layout.constraints[2].multiplier, 1)
        XCTAssertEqual(layout.constraints[2].constant, 0)
        
        XCTAssertEqual(layout.constraints[3].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[3].firstAttribute, .right)
        XCTAssertEqual(layout.constraints[3].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[3].secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(layout.constraints[3].secondAttribute, .rightMargin)
        XCTAssertEqual(layout.constraints[3].priority, .required)
        XCTAssertEqual(layout.constraints[3].multiplier, 1)
        XCTAssertEqual(layout.constraints[3].constant, 0)
    }
    
    func test_greaterThanOrEqual_modified() throws {
        let layout = makeConstraints { views in
            views.detail.titleLabel.anchors.directionalEdges >= views.detail.subtitleLabel.anchors.directionalMargins
                ~ .priority(.defaultLow)
                ~ .inset(by: UIEdgeInsets(top: 12, left: 24, bottom: 36, right: 48))
                ~ .multiplied(by: 1.5)
        }
        
        
        XCTAssertEqual(layout.constraints.count, 4)
        
        guard layout.constraints.count == 4 else {
            return XCTFail()
        }
        
        XCTAssertEqual(layout.constraints[0].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[0].firstAttribute, .top)
        XCTAssertEqual(layout.constraints[0].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[0].secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(layout.constraints[0].secondAttribute, .topMargin)
        XCTAssertEqual(layout.constraints[0].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[0].multiplier, 1.5)
        XCTAssertEqual(layout.constraints[0].constant, 12)

        XCTAssertEqual(layout.constraints[1].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[1].firstAttribute, .bottom)
        XCTAssertEqual(layout.constraints[1].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[1].secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(layout.constraints[1].secondAttribute, .bottomMargin)
        XCTAssertEqual(layout.constraints[1].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[1].multiplier, 1.5)
        XCTAssertEqual(layout.constraints[1].constant, -36)
        
        XCTAssertEqual(layout.constraints[2].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[2].firstAttribute, .leading)
        XCTAssertEqual(layout.constraints[2].relation, .lessThanOrEqual)
        XCTAssertEqual(layout.constraints[2].secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(layout.constraints[2].secondAttribute, .leadingMargin)
        XCTAssertEqual(layout.constraints[2].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[2].multiplier, 1.5)
        XCTAssertEqual(layout.constraints[2].constant, 24)
        
        XCTAssertEqual(layout.constraints[3].firstItem, layout.views.detail.titleLabel)
        XCTAssertEqual(layout.constraints[3].firstAttribute, .trailing)
        XCTAssertEqual(layout.constraints[3].relation, .greaterThanOrEqual)
        XCTAssertEqual(layout.constraints[3].secondItem, layout.views.detail.subtitleLabel)
        XCTAssertEqual(layout.constraints[3].secondAttribute, .trailingMargin)
        XCTAssertEqual(layout.constraints[3].priority, .defaultLow)
        XCTAssertEqual(layout.constraints[3].multiplier, 1.5)
        XCTAssertEqual(layout.constraints[3].constant, -48)
    }
 
}

