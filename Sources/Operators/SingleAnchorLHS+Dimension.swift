//
//  Created by Jérôme Alves on 11/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

// MARK: - label.anchors.width <> 80 // DimensionAnchorKind

public func == <LHSBase, LHSAttribute: Attribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: ConstraintDimension
) where
    LHSAttribute.Kind : DimensionAttributeKind
{
    Layout.push(lhs, .equal, rhs)
}

public func <= <LHSBase, LHSAttribute: Attribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: ConstraintDimension
) where
    LHSAttribute.Kind : DimensionAttributeKind
{
    Layout.push(lhs, .lessThanOrEqual, rhs)
}

public func >= <LHSBase, LHSAttribute: Attribute>(
    lhs: SingleAnchor<LHSBase, LHSAttribute>,
    rhs: ConstraintDimension
) where
    LHSAttribute.Kind : DimensionAttributeKind
{
    Layout.push(lhs, .greaterThanOrEqual, rhs)
}

extension Layout {
    fileprivate static func push<LHSBase, A: Attribute>(
        _ lhs: SingleAnchor<LHSBase, A>?,
        _ relation: NSLayoutConstraint.Relation?,
        _ rhs: ConstraintDimension?
    ) where
        A.Kind: DimensionAttributeKind
    {
        guard let lhs = lhs, let relation = relation, let rhs = rhs else {
            return
        }
        push(Constraint.init(lhs, relation, rhs))
    }
}

extension Constraint {
    
    fileprivate init<LHSBase, T>(
        _ lhs: SingleAnchor<LHSBase, T>,
        _ relation: NSLayoutConstraint.Relation,
        _ rhs: ConstraintDimension
    ) where
        T.Kind: DimensionAttributeKind
    {
        self.lhs = ConstraintExpression(lhs)
        self.relation = relation
        self.rhs = .dimension(rhs)
        self.constraintProperties = rhs.constraintProperties
    }
    
}
