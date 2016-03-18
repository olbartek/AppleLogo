
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

    func animateAppleLogo() {
        guard let path = NSBundle.mainBundle().pathForResource("bubbles", ofType: "plist"), plistArray = NSArray(contentsOfFile: path) as? [NSDictionary] else { return }
        for bubbleInfo in plistArray {
            let newBubble           = AnimationDot(dictionary: bubbleInfo, toTime: Double.random(1, max: 2.5), fromTime: Double.random(1, max: 2.5), scaleFactor: scaleFactor)
            addSubview(newBubble)
            dots.append(newBubble)
        }
        dots.forEach() { dot in
            dot.animateView(self)
        }
        
    }
}