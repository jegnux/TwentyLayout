//
//  ConstraintOperand+Optional.swift
//  TwentyLayout-iOS
//
//  Created by Jérôme Alves on 14/01/2020.
//  Copyright © 2020 TwentyLayout. All rights reserved.
//

import Foundation

extension Optional: ModifiableConstraintOperand where Wrapped: ModifiableConstraintOperand {}
extension Optional: Offsetable where Wrapped: Offsetable {}
extension Optional: Insetable where Wrapped: Insetable {}
extension Optional: Multiplicable where Wrapped: Multiplicable {}

extension Optional: ConstraintOperand where Wrapped: ConstraintOperand {
    public var constraintValue: Wrapped? {
        return self
    }
}
