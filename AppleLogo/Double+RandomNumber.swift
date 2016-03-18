//
//  Double+RandomNumber.swift
//  AppleLogo
//
//  Created by Błażej Chwiećko on 18/03/16.
//  Copyright © 2016 Błażej Chwiećko. All rights reserved.
//

import UIKit

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