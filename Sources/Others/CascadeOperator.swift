import Foundation

prefix operator ..
infix operator ..: MultiplicationPrecedence

@discardableResult
internal func .. <T>(object: T, configuration: (inout T) -> Void) -> T {
    var copy = object
    configuration(&copy)
    return copy
}
