//
//  ViewController.swift
//  AppleLogo
//
//  Created by Błażej Chwiećko on 17/03/16.
//  Copyright © 2016 Błażej Chwiećko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dots = [AnimationDot]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let animationDot = AnimationDot(color: UIColor.redColor(), position: CGPoint(x: 50, y: 50), radius: 10, toTime: 1, fromTime: 8)
        let animationDot2 = AnimationDot(color: UIColor.blackColor(), position: CGPoint(x: 100, y: 100), radius: 20, toTime: 2, fromTime: 7)
        let animationDot3 = AnimationDot(color: UIColor.greenColor(), position: CGPoint(x: 200, y: 200), radius: 30, toTime: 3, fromTime: 6)
        let animationDot4 = AnimationDot(color: UIColor.orangeColor(), position: CGPoint(x: 300, y: 300), radius: 40, toTime: 4, fromTime: 5)

        view.addSubview(animationDot)
        dots.append(animationDot)
        view.addSubview(animationDot2)
        dots.append(animationDot2)
        view.addSubview(animationDot3)
        dots.append(animationDot3)
        view.addSubview(animationDot4)
        dots.append(animationDot4)

        dots.forEach() { dot in
            dot.animateView(view)
        }
    }

}

