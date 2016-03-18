//
//  AnimationDot.swift
//  AppleLogo
//
//  Created by Błażej Chwiećko on 17/03/16.
//  Copyright © 2016 Błażej Chwiećko. All rights reserved.
//

import UIKit

struct BubbleColor {
    static let LightGreenColor  = UIColor(red: 206.0 / 255.0, green: 224.0 / 255.0, blue: 79.0 / 255.0, alpha: 0.7)
    static let GreenColor       = UIColor(red: 164.0 / 255.0, green: 207.0 / 255.0, blue: 72.0 / 255.0, alpha: 0.7)
    static let YellowColor      = UIColor(red: 247.0 / 255.0, green: 241.0 / 255.0, blue: 58.0 / 255.0, alpha: 0.7)
    static let OrangeColor      = UIColor(red: 241.0 / 255.0, green: 140.0 / 255.0, blue: 74.0 / 255.0, alpha: 0.7)
    static let RedColor         = UIColor(red: 241.0 / 255.0, green: 106.0 / 255.0, blue: 123.0 / 255.0, alpha: 0.7)
    static let BeetrootColor    = UIColor(red: 189.0 / 255.0, green: 84.0 / 255.0, blue: 144.0 / 255.0, alpha: 0.7)
    static let PurpleColor      = UIColor(red: 174.0 / 255.0, green: 139.0 / 255.0, blue: 190.0 / 255.0, alpha: 0.7)
    static let BluePurpleColor  = UIColor(red: 145.0 / 255.0, green: 187.0 / 255.0, blue: 232.0 / 255.0, alpha: 0.7)
    static let BlueColor        = UIColor(red: 76.0 / 255.0, green: 129.0 / 255.0, blue: 153.0 / 255.0, alpha: 0.7)
}

class AnimationDot: UIView {
    
    // MARK: Properties
    
    var color       : UIColor?
    var origin      : CGPoint?
    var viewCenter  : CGPoint?
    var radius      : CGFloat?
    var toTime      : NSTimeInterval = 1
    var fromTime    : NSTimeInterval = 1
    var scaleFactor : CGFloat = 1.0;
    
    let animationResumeAfter: NSTimeInterval    = 4 // should be higher than the greatest toTime, animationResumeAfter - toTime = animation pause duration
    
    // MARK: Initialization
    init(dictionary: NSDictionary, toTime: NSTimeInterval, fromTime: NSTimeInterval, scaleFactor scale: CGFloat) {
        let x = dictionary["x"] as! CGFloat, y = dictionary["y"] as! CGFloat, side = dictionary["side"] as! CGFloat, colorString = dictionary["color"] as! String
        self.scaleFactor        = scale
        let origin              = CGPointMake(x * scaleFactor, y * scaleFactor)
        let size                = CGSize(width: side * scaleFactor, height: side * scaleFactor)
        super.init(frame: CGRect(origin: origin, size: size))
        self.origin             = origin
        let radius              = side * scaleFactor / 2
        self.radius             = radius
        self.viewCenter         = CGPoint(x: x + radius, y: y + radius)
        self.toTime             = toTime
        self.fromTime           = fromTime
        backgroundColor         = colorFromString(colorString)
        self.layer.cornerRadius = radius
        self.clipsToBounds      = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: Helper methods
    
    func colorFromString(colorString: String) -> UIColor? {
        switch colorString {
        case "LightGreen":
            return BubbleColor.LightGreenColor
        case "Green":
            return BubbleColor.GreenColor
        case "Yellow":
            return BubbleColor.YellowColor
        case "Orange":
            return BubbleColor.OrangeColor
        case "Red":
            return BubbleColor.RedColor
        case "Beetroot":
            return BubbleColor.BeetrootColor
        case "Purple":
            return BubbleColor.PurpleColor
        case "BluePurple":
            return BubbleColor.BluePurpleColor
        case "Blue":
            return BubbleColor.BlueColor
        default:
            return nil
        }
    }
    
    // MARK: Animations
    
    func animateView(view: UIView) {
        self.animateViewToPositon(view)
        let resumeAnimation = dispatch_time(DISPATCH_TIME_NOW, Int64(animationResumeAfter * Double(NSEC_PER_SEC)))
        dispatch_after(resumeAnimation, dispatch_get_main_queue()) {
            self.animateViewFromPostion(view)
        }
    }
    
    func animateViewToPositon(view: UIView) {
        let animation               = CAKeyframeAnimation(keyPath: "position")
        let path = UIBezierPath()
        
        let startPoint              = CGPoint(x: center.x, y: view.frame.height)
        let endPoint                = CGPoint(x: center.x, y: center.y)
        
        path.moveToPoint(startPoint)
        path.addLineToPoint(endPoint)
        
        animation.path              = path.CGPath
        animation.calculationMode   = kCAAnimationCubicPaced
        animation.duration          = toTime
        animation.timingFunction    = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)

        self.layer.addAnimation(animation, forKey: "positionAnimation")
    }
    
    func animateViewFromPostion(view: UIView) {
        let animation               = CAKeyframeAnimation(keyPath: "position")
        let path = UIBezierPath()

        let startPoint              = CGPoint(x: center.x, y: center.y)
        let endPoint                = CGPoint(x: center.x, y: -view.frame.height)
        
        path.moveToPoint(startPoint)
        path.addLineToPoint(endPoint)
        
        animation.path              = path.CGPath
        animation.calculationMode   = kCAAnimationCubicPaced
        animation.duration          = fromTime
        animation.timingFunction    = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)

        self.layer.addAnimation(animation, forKey: "positionAnimation")
        
        let removeTime = dispatch_time(DISPATCH_TIME_NOW, Int64((animation.duration - 0.5) * Double(NSEC_PER_SEC)))
        dispatch_after(removeTime, dispatch_get_main_queue()) {
            self.removeFromSuperview()
        }
    }
}
