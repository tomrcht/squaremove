//
//  SquareView.swift
//  squaremove
//
//  Created by Tom Rochat on 27/12/2019.
//  Copyright © 2019 Tom Rochat. All rights reserved.
//

import UIKit

class SquareView: UIView {
    var lastCenterPosition: CGPoint = CGPoint(x: 0, y: 0)

    override init(frame: CGRect) {
        super.init(frame: frame)

        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.move))
        panGestureRecognizer.maximumNumberOfTouches = 1
        addGestureRecognizer(panGestureRecognizer)

        backgroundColor = UIColor.random(withAlpha: false)
    }

    required init?(coder: NSCoder) {
        fatalError("ini(coder:) is not implemented")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        superview?.bringSubviewToFront(self)
        lastCenterPosition = center

    }

    @objc func move(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.superview)
        center = CGPoint(x: lastCenterPosition.x + translation.x, y: lastCenterPosition.y + translation.y)
    }
}

extension UIColor {
    static func random(withAlpha: Bool) -> UIColor {
        let r = CGFloat.random(in: 0 ..< 1)
        let g = CGFloat.random(in: 0 ..< 1)
        let b = CGFloat.random(in: 0 ..< 1)

        return UIColor(red: r, green: g, blue: b, alpha: withAlpha ? CGFloat.random(in: 0 ..< 1) : 1.0)
    }
}
