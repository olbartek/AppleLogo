//
//  ViewController.swift
//  AppleLogo
//
//  Created by Błażej Chwiećko on 17/03/16.
//  Copyright © 2016 Błażej Chwiećko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let animationDot = AnimationDot(color: UIColor.redColor(), position: CGPoint(x: 100, y: 100), radius: 20)
        view.addSubview(animationDot)

        animationDot.animateViewToPositon(view)
        let resumeAnimation = dispatch_time(DISPATCH_TIME_NOW, Int64(5 * Double(NSEC_PER_SEC)))
        dispatch_after(resumeAnimation, dispatch_get_main_queue()) {
            animationDot.animateViewFromPostion(self.view)
        }
    }

}

