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
    
    let colorViews = (1...10).map { _ in
        ColorView(.random)
    }
       
    let button = UIButton(type: .custom)
    
    @LayoutController
    var currentLayout: Layout?
    
    func makeLayout() -> Layout {
        Layout {
            for view in colorViews {
                view.anchors.width == 80
                view.anchors.height == \.width
                view.anchors.center == CGPoint(x: .random(in: -150...150), y: .random(in: -150...150))
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addLayoutGuide(stackLayoutGuide) {
            $0.center == view
        }
        
        view.addSubviews(colorViews)

        button.setTitleColor(.red, for: .normal)
        button.setTitle("Randomize!", for: .normal)
        
        let buttonBackground = UIView()
        buttonBackground.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        buttonBackground.addSubview(button) { make in
            button.anchors.edges == \.superview
                ~ .inset(top: 4, left: 8, bottom: 4, right: 8)
        }
        
        view.addSubview(buttonBackground) { make in
            make.centerX == \.superview
            make.bottom == \.superview?.safeAreaLayoutGuide
                ~ .inset(by: 10)
        }
        
        button.addTarget(self, action: #selector(randomize), for: .touchUpInside)
        
        currentLayout = makeLayout()
    }
    
    @objc
    private func randomize(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: [], animations: {
            self.currentLayout = self.makeLayout()
        }, completion: nil)
    }
}

extension UIColor {
    
    static var random: UIColor {
        UIColor(hue: .random(in: 0...1), saturation: 1, brightness: .random(in: 0...1), alpha: 1)
    }
}
