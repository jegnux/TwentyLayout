//
//  Created by Jérôme Alves on 06/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import Foundation
import UIKit

extension NSLayoutConstraint.Relation {
    public var alp_description: String {
        switch self {
        case .lessThanOrEqual: return "<="
        case .equal: return "=="
        case .greaterThanOrEqual: return ">="
        @unknown default: return ".unknown"
        }
    }
}

extension NSLayoutConstraint.Attribute {
    public var alp_description: String {
        switch self {
        case .left: return ".left"
        case .right: return ".right"
        case .top: return ".top"
        case .bottom: return ".bottom"
        case .leading: return ".leading"
        case .trailing: return ".trailing"
        case .width: return ".width"
        case .height: return ".height"
        case .centerX: return ".centerX"
        case .centerY: return ".centerY"
        case .lastBaseline: return ".lastBaseline"
        case .firstBaseline: return ".firstBaseline"
        case .leftMargin: return ".leftMargin"
        case .rightMargin: return ".rightMargin"
        case .topMargin: return ".topMargin"
        case .bottomMargin: return ".bottomMargin"
        case .leadingMargin: return ".leadingMargin"
        case .trailingMargin: return ".trailingMargin"
        case .centerXWithinMargins: return ".centerXWithinMargins"
        case .centerYWithinMargins: return ".centerYWithinMargins"
        case .notAnAttribute: return ".notAnAttribute"
        @unknown default: return ".unknown"
        }
    }
}
