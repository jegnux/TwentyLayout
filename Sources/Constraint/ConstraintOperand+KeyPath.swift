//
//  ConstraintOperand+KeyPath.swift
//  TwentyLayout-iOS
//
//  Created by Jérôme Alves on 14/01/2020.
//  Copyright © 2020 TwentyLayout. All rights reserved.
//

import Foundation

extension KeyPath: ModifiableConstraintOperand where Value: ModifiableConstraintOperand {}
extension KeyPath: Offsetable where Value: Offsetable {}
extension KeyPath: Insetable where Value: Insetable {}
extension KeyPath: Multiplicable where Value: Multiplicable {}

extension KeyPath: ConstraintOperand where Value: ConstraintOperand {
    public var constraintValue: KeyPath {
        return self
    }
}
