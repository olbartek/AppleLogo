
//
//  AnimatedAppleLogoView.swift
//  AppleLogo
//
//  Created by Bartosz Olszanowski on 18.03.2016.
//  Copyright © 2016 Błażej Chwiećko. All rights reserved.
//

import UIKit

class AnimatedAppleLogoView: UIView {
    
    // MARK: Properties
    var dots                                    = [AnimationDot]()
    var scaleFactor: CGFloat                    = 1.0               // default View has  600 pts width, so when it will be different the scaleFactor will change
    
    let defaultSideLength: CGFloat              = 600.0
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Configuration
    func calculateScaleFactor() {
        scaleFactor = bounds.size.width / defaultSideLength;
    }
    
    // MARK: Animations
    
    func animateExampleViews() {
        let animationDot        = AnimationDot(color: UIColor.redColor(), center: CGPoint(x: 50, y: 50), radius: 10, toTime: 2.5, fromTime: 2)
        let animationDot2       = AnimationDot(color: UIColor.blackColor(), center: CGPoint(x: 100, y: 100), radius: 20, toTime: 2.5, fromTime: 2)
        let animationDot3       = AnimationDot(color: UIColor.greenColor(), center: CGPoint(x: 200, y: 200), radius: 30, toTime: 2.5, fromTime: 2)
        let animationDot4       = AnimationDot(color: UIColor.orangeColor(), center: CGPoint(x: 300, y: 300), radius: 40, toTime: 2.5, fromTime: 2)
        
        addSubview(animationDot)
        dots.append(animationDot)
        addSubview(animationDot2)
        dots.append(animationDot2)
        addSubview(animationDot3)
        dots.append(animationDot3)
        addSubview(animationDot4)
        dots.append(animationDot4)
        
        dots.forEach() { dot in
            dot.animateView(self)
        }
    }
    
    func animateAppleLogo() {
        guard let path = NSBundle.mainBundle().pathForResource("bubbles", ofType: "plist"), plistArray = NSArray(contentsOfFile: path) as? [NSDictionary] else { return }
        for bubbleInfo in plistArray {
            let newBubble           = AnimationDot(dictionary: bubbleInfo, toTime: Double.random(0.5, max: 2.5), fromTime: Double.random(1, max: 2.5), scaleFactor: scaleFactor)
            addSubview(newBubble)
            dots.append(newBubble)
        }
        dots.forEach() { dot in
            dot.animateView(self)
        }
        
    }
}

public extension Double {
    
    public static var random:Double {
        get {
            return Double(arc4random()) / 0xFFFFFFFF
        }
    }

    public static func random(min: Double, max: Double) -> Double {
        return Double.random * (max - min) + min
    }
}
