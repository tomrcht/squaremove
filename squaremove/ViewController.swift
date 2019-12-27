//
//  ViewController.swift
//  squaremove
//
//  Created by Tom Rochat on 27/12/2019.
//  Copyright © 2019 Tom Rochat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let squareSize: CGFloat = 50.0

    override func viewDidLoad() {
        super.viewDidLoad()

        spawnSquares(count: 100)
    }

    private func spawnSquares(count: UInt) -> Void {
        let maxX = view.bounds.maxX
        let maxY = view.bounds.maxY

        for _ in 0 ..< count {
            let x = CGFloat.random(in: 0 ..< maxX - squareSize)
            let y = CGFloat.random(in: 0 ..< maxY - squareSize)

            let square = SquareView(frame: CGRect(x: x, y: y, width: squareSize, height: squareSize))
            view.addSubview(square)
        }
    }
}

