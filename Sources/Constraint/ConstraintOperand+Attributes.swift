//
//  ConstraintOperand+Attribute.swift
//  TwentyLayout-iOS
//
//  Created by Jérôme Alves on 14/01/2020.
//  Copyright © 2020 TwentyLayout. All rights reserved.
//

import Foundation

extension Top: ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {
    public var constraintValue: Top {
        return self
    }
}
extension Left: ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {
    public var constraintValue: Left {
        return self
    }
}
extension Leading: ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {
    public var constraintValue: Leading {
        return self
    }
}
extension Trailing: ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {
    public var constraintValue: Trailing {
        return self
    }
}
extension Right: ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {
    public var constraintValue: Right {
        return self
    }
}
extension Bottom: ModifiableConstraintOperand, Offsetable, Insetable, Multiplicable {
    public var constraintValue: Bottom {
        return self
    }
}
extension CenterX: ModifiableConstraintOperand, Offsetable, Multiplicable {
    public var constraintValue: CenterX {
        return self
    }
}
extension CenterY: ModifiableConstraintOperand, Offsetable, Multiplicable {
    public var constraintValue: CenterY {
        return self
    }
}
extension Width: ModifiableConstraintOperand, Offsetable, Multiplicable {
    public var constraintValue: Width {
        return self
    }
}
extension Height: ModifiableConstraintOperand, Offsetable, Multiplicable {
    public var constraintValue: Height {
        return self
    }
}
extension FirstBaseline: ModifiableConstraintOperand, Offsetable, Multiplicable {
    public var constraintValue: FirstBaseline {
        return self
    }
}
extension LastBaseline: ModifiableConstraintOperand, Offsetable, Multiplicable {
    public var constraintValue: LastBaseline {
        return self
    }
}

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
