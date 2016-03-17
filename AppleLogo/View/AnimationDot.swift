//
//  AnimationDot.swift
//  AppleLogo
//
//  Created by Błażej Chwiećko on 17/03/16.
//  Copyright © 2016 Błażej Chwiećko. All rights reserved.
//

import UIKit

class AnimationDot: UIView {
    
    var color       : UIColor?
    var position    : CGPoint?
    var radius      : CGFloat?
    var toTime      : NSTimeInterval = 4
    var fromTime    : NSTimeInterval = 4
    
    init(color: UIColor, position: CGPoint, radius: CGFloat, toTime: NSTimeInterval, fromTime: NSTimeInterval) {
        super.init(frame: CGRect(origin: CGPointMake(position.x - radius, position.y - radius), size: CGSize(width: 2*radius, height: 2*radius)))
        self.position = position
        self.radius = radius
        self.toTime = toTime
        self.fromTime = fromTime
        backgroundColor = color
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func animateView(view: UIView) {
        self.animateViewToPositon(view)
        let resumeAnimation = dispatch_time(DISPATCH_TIME_NOW, Int64(animationResumeAfter * Double(NSEC_PER_SEC)))
        dispatch_after(resumeAnimation, dispatch_get_main_queue()) {
            self.animateViewFromPostion(view)
        }
    }
    
    func animateViewToPositon(view: UIView) {
        guard let position = position else { return }
        let animation = CABasicAnimation(keyPath: "position")
        
        let startPoint = CGPoint(x: position.x, y: view.frame.height)
        let startPointObj = NSValue(CGPoint: startPoint)
        animation.fromValue =  startPointObj
        
        let endPoint = CGPoint(x: position.x, y: position.y)
        let endPointObj = NSValue(CGPoint: endPoint)
        animation.toValue = endPointObj
        
        animation.duration = toTime
        
        self.layer.addAnimation(animation, forKey: "\(position.x)\(position.y)")
    }
    
    func animateViewFromPostion(view: UIView) {
        guard let position = position else { return }
        let animation = CABasicAnimation(keyPath: "position")
        
        let startPoint = CGPoint(x: position.x, y: position.y)
        let startPointObj = NSValue(CGPoint: startPoint)
        animation.fromValue =  startPointObj
        
        let endPoint = CGPoint(x: position.x, y: -view.frame.height)
        let endPointObj = NSValue(CGPoint: endPoint)
        animation.toValue = endPointObj
        
        animation.duration = fromTime
        
        self.layer.addAnimation(animation, forKey: "\(position.x)\(position.y)")
        
        let removeTime = dispatch_time(DISPATCH_TIME_NOW, Int64((animation.duration - 0.1) * Double(NSEC_PER_SEC)))
        dispatch_after(removeTime, dispatch_get_main_queue()) {
            self.removeFromSuperview()
        }
    }
}
