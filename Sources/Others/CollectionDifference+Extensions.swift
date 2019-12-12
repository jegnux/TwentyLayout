//
//  Created by Jérôme Alves on 06/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation

@available(iOSApplicationExtension 13, *)
extension CollectionDifference.Change {
    internal var offset: Int {
        switch self {
        case .insert(let value, _, _): return value
        case .remove(let value, _, _): return value
        }
    }
    internal var element: ChangeElement {
        switch self {
        case .insert(_, let value, _): return value
        case .remove(_, let value, _): return value
        }
    }
    internal var associatedOffset: Int? {
        switch self {
        case .insert(_, _, let value): return value
        case .remove(_, _, let value): return value
        }
    }
}

@available(iOSApplicationExtension 13, *)
extension CollectionDifference where ChangeElement : Hashable {
    internal func filteringMoves() -> CollectionDifference<ChangeElement> {
        return CollectionDifference(inferringMoves().filter {
            switch $0 {
            case .insert(_, _, .some): return false
            case .remove(_, _, .some): return false
            default: return true
            }
        })!
    }
}
