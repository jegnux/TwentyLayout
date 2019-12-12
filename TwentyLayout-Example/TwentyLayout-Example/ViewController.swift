//
//  Created by Jérôme Alves on 01/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

import UIKit
import TwentyLayout

class ColorView : UIView {
    init(_ color: UIColor) {
        super.init(frame: .zero)
        backgroundColor = color
    }
    required init(coder: NSCoder) {
        fatalError()
    }
    override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 44)
    }
}

class ViewController : UIViewController {
    let stackLayoutGuide = UILayoutGuide()
    
    let red = ColorView(.red)
    let blue = ColorView(.blue)
    let magenta = ColorView(.magenta)
    let green = ColorView(.green)
    let yellow = ColorView(.yellow)
    let purple = ColorView(.purple)
    let button = UIButton(type: .custom)
    
    @LayoutController
    var currentLayout: Layout?

    var selectableViews: [UIView] { [blue, green, yellow, purple] }

    var selectedIndex: Int = 0 {
        didSet {
            UIView.animate(withDuration: 0.3, delay: 0, options: .beginFromCurrentState, animations: {
                self.currentLayout = self.makeLayout()
            }, completion: nil)
        }
    }
    
    func makeLayout() -> Layout {
        Layout {
            Layout.HStack(
                bounds: stackLayoutGuide,
                spacing: 8,
                content: selectableViews
            )
            Layout.VStack(
                alignment: .centerX,
                spacing: 8,
                content: [
                    red,
                    selectableViews[selectedIndex],
                    magenta,
                ]
            )
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addLayoutGuide(stackLayoutGuide) {
            $0.centerX == view
            $0.centerY == view
        }
        
        view.addSubviews(red, blue, magenta, green, yellow, purple) { views in
            for view in views {
                view.anchors.size == 80
                view.anchors.height == \.width
            }
        }

        button.setTitleColor(.red, for: .normal)
        button.setTitle("Select Random", for: .normal)
        
        let buttonBackground = UIView()
        buttonBackground.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        buttonBackground.addSubview(button) { make in
            make.edges == its(\.superview)
        }
        
        view.addSubview(buttonBackground) { make in
            make.centerX == \.superview
            make.bottom == its(\.superview?.safeAreaLayoutGuide)
                .offset(by: -10)
        }
        
        button.addTarget(self, action: #selector(toggleLayout), for: .touchUpInside)
        
        currentLayout = makeLayout()
    }
    
    @objc
    private func toggleLayout(_ sender: UIButton) {
        let current = selectedIndex
        repeat {
            selectedIndex = selectableViews.indices.randomElement()!
        } while selectedIndex == current
    }
}
