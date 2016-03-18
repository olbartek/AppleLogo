//
//  ViewController.swift
//  AppleLogo
//
//  Created by Błażej Chwiećko on 17/03/16.
//  Copyright © 2016 Błażej Chwiećko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var animatedView: AnimatedAppleLogoView!
    
    
    // MARK: VC's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        animatedView.calculateScaleFactor()
        animatedView.animateAppleLogo()
    }

}

