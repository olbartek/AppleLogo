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
        super.init(frame: CGRect(origin: position, size: CGSize(width: 2*radius, height: 2*radius)))
        self.color = color
        self.position = position
        self.radius = radius
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
