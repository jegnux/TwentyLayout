//
//  ConstraintOperand+Anchors.swift
//  TwentyLayout-iOS
//
//  Created by Jérôme Alves on 14/01/2020.
//  Copyright © 2020 TwentyLayout. All rights reserved.
//

import Foundation

extension SingleAnchor: ModifiableConstraintOperand where Attribute: ModifiableConstraintOperand {}
extension SingleAnchor: Offsetable where Attribute: Offsetable {}
extension SingleAnchor: Insetable where Attribute: Insetable {}
extension SingleAnchor: Multiplicable where Attribute: Multiplicable {}

extension PointAnchor: ModifiableConstraintOperand where XAttribute: ModifiableConstraintOperand, YAttribute: ModifiableConstraintOperand {}
extension PointAnchor: Offsetable where XAttribute: Offsetable, YAttribute: Offsetable {}
extension PointAnchor: Insetable where XAttribute: Insetable, YAttribute: Insetable {}
extension PointAnchor: Multiplicable where XAttribute: Multiplicable, YAttribute: Multiplicable {}

extension SizeAnchor: ModifiableConstraintOperand {}
extension SizeAnchor: Offsetable {}
extension SizeAnchor: Multiplicable {}

extension EdgesAnchor: ModifiableConstraintOperand {}
extension EdgesAnchor: Offsetable {}
extension EdgesAnchor: Insetable {}
extension EdgesAnchor: Multiplicable {}


extension SingleAnchor: ConstraintOperand where Attribute: ConstraintOperand {
    public var constraintValue: Self {
        return self
    }
}

extension PointAnchor: ConstraintOperand where XAttribute: ConstraintOperand, YAttribute: ConstraintOperand {
    public var constraintValue: Self {
        return self
    }
}

extension SizeAnchor: ConstraintOperand {
    public var constraintValue: SizeAnchor {
        return self
    }
}

extension EdgesAnchor: ConstraintOperand {
    public var constraintValue: EdgesAnchor {
        return self
    }
}
