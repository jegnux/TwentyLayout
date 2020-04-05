//
//  Created by Jérôme Alves on 20/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit
@_exported import XCTest
@_exported @testable import TwentyLayout

final class DetailView: UIView {
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    init() {
        super.init(frame: .zero)
        addSubviews(titleLabel, subtitleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class ContainerView: UIView {
    var container: UIView { return self }
    let image = UIImageView()
    let detail = DetailView()
    let loading = UIActivityIndicatorView()
    let guide = UILayoutGuide()
    init() {
        super.init(frame: .zero)
        addSubviews(image, detail, loading)
        addLayoutGuide(guide)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class Result {
    let views: ContainerView
    let layout: Layout
    private(set) lazy var constraints: [NSLayoutConstraint] = {
        layout.constraints.forEach { layout.updateOrCreateLayoutConstraint(for: $0) }
        return layout.layoutConstraints.compactMap({ $0 })
    }()
    
    internal init(views: ContainerView, layout: Layout) {
        self.views = views
        self.layout = layout
    }
}

func makeConstraints(views: ContainerView = ContainerView(), _ make: (ContainerView) -> Void) -> Result {
    let layout = Layout {
        make(views)
    }
    return Result(views: views, layout: layout)
}

func XCTAssertEqual(_ lhs: AnyObject?, _ rhs: AnyObject, file: StaticString = #file, line: UInt = #line) {
    if let lhs = lhs as? NSObject, let rhs = rhs as? NSObject {
        XCTAssertEqual(lhs, rhs, "", file: file, line: line)
    } else {
        XCTAssertTrue(lhs === rhs, #"("\#(lhs.map(String.init(describing:)) ?? "nil")") is not equal to ("\#(rhs)")"#, file: file, line: line)
    }
}

func XCTAssertType<T>(_ lhs: Any, _ rhs: T.Type, file: StaticString = #file, line: UInt = #line) {
    XCTAssert(lhs is T, file: file, line: line)
}
