//
//  ConstraintOperand+Attribute.swift
//  TwentyLayout-iOS
//
//  Created by Jérôme Alves on 14/01/2020.
//  Copyright © 2020 TwentyLayout. All rights reserved.
//

import Foundation

extension Top:  ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {}
extension Left: ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {}
extension Leading:  ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {}
extension Trailing: ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {}
extension Right:    ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {}
extension Bottom:   ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {}
extension CenterX:  ModifiableConstraintOperand, Offsetable, Multiplicable {}
extension CenterY:  ModifiableConstraintOperand, Offsetable, Multiplicable {}
extension Width:    ModifiableConstraintOperand, Offsetable, Multiplicable {}
extension Height:   ModifiableConstraintOperand, Offsetable, Multiplicable {}
extension FirstBaseline:    ModifiableConstraintOperand, Offsetable, Multiplicable {}
extension LastBaseline:     ModifiableConstraintOperand, Offsetable, Multiplicable {}

extension Margin: ModifiableConstraintOperand where T: ModifiableConstraintOperand {}
extension Margin: Offsetable where T: Offsetable {}
extension Margin: Insetable where T: Insetable {}
extension Margin: Multiplicable where T: Multiplicable {}

extension WithinMargins: ModifiableConstraintOperand where T: ModifiableConstraintOperand {}
extension WithinMargins: Offsetable where T: Offsetable {}
extension WithinMargins: Insetable where T: Insetable {}
extension WithinMargins: Multiplicable where T: Multiplicable {}

extension Margin: ConstraintOperand where T: ConstraintOperand {
    public var constraintValue: Self {
        return self
    }
}

extension WithinMargins: ConstraintOperand where T: ConstraintOperand {
    public var constraintValue: Self {
        return self
    }
}
