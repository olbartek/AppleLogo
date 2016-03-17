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
        //animationDot.calculateBezierPath(view)
        animationDot.animateViewMovment(view)
        let stopTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * Double(NSEC_PER_SEC)))
        dispatch_after(stopTime, dispatch_get_main_queue()) {
            self.pauseLayer(animationDot.layer)
        }
        let resumeTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
        dispatch_after(resumeTime, dispatch_get_main_queue()) {
            self.resumeLayer(animationDot.layer)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func pauseLayer(layer: CALayer) {
        let pausedTime = layer.convertTime(CACurrentMediaTime(), fromLayer: nil)
        layer.speed = 0.0
        layer.timeOffset = pausedTime
    }
    
    func resumeLayer(layer: CALayer) {
        let pausedTime = layer.timeOffset
        layer.speed = 1.0
        layer.timeOffset = 0.0
        layer.beginTime = 0.0
        let timeSincePause = layer.convertTime(CACurrentMediaTime(), fromLayer: nil) - pausedTime
        layer.beginTime = timeSincePause
    }
    
}

