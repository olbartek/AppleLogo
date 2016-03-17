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
    
    init(color: UIColor, position: CGPoint, radius: CGFloat) {
        super.init(frame: CGRect(origin: CGPointMake(position.x - radius, position.y - radius), size: CGSize(width: 2*radius, height: 2*radius)))
        self.position = position
        self.radius = radius
        backgroundColor = color
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
        
        animation.duration = 3
        
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
        
        animation.duration = 3
        
        self.layer.addAnimation(animation, forKey: "\(position.x)\(position.y)")
        
        let removeTime = dispatch_time(DISPATCH_TIME_NOW, Int64(animation.duration * Double(NSEC_PER_SEC)))
        dispatch_after(removeTime, dispatch_get_main_queue()) {
            self.removeFromSuperview()

        }
    }
}
