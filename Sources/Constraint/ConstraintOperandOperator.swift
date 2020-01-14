//
//  ConstraintOperandOperator.swift
//  TwentyLayout-iOS
//
//  Created by Jérôme Alves on 14/01/2020.
//  Copyright © 2020 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

precedencegroup ConstraintModifierPrecedenceGroup {
    higherThan: MultiplicationPrecedence
    lowerThan: BitwiseShiftPrecedence
    associativity: left
    assignment: false
}
infix operator ~ : ConstraintModifierPrecedenceGroup

public func ~ <T>(lhs: T, mutation: ConstraintOperandMutation<T>) -> ModifiedConstraintOperand<T> {
    return mutation.mutating(lhs)
}

public func ~ <T>(lhs: ModifiedConstraintOperand<T>, mutation: ConstraintOperandMutation<T>) -> ModifiedConstraintOperand<T> {
    return mutation.mutating(lhs)
}

internal func ~ <T: ModifiableConstraintOperand, U: ConstraintOperand>(lhs: T, rhs: U) -> ModifiedConstraintOperand<T> {
    return ModifiedConstraintOperand(original: lhs, other: rhs)
}

internal func ~ <T: ModifiableConstraintOperand, U: ConstraintOperand>(lhs: T?, rhs: U) -> ModifiedConstraintOperand<T>? {
    guard let lhs = lhs else { return nil }
    return ModifiedConstraintOperand(original: lhs, other: rhs)
}
