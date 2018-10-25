//
//  UIButton+Fade.swift
//  Djingo
//
//  Created by vdh on 21/06/2018.
//  Copyright © 2018 devrap. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    public func changeTitleWithFade(newText:String) {
        self.fadeOut(duration: 0.3, delay: 0) { (true) in
            self.setTitle(newText, for: UIControl.State.normal)
            self.fadeIn(duration: 0.3, delay: 0) {(true) in
                
            }
        }
    }
    
    public func changeAction(target:Any, theSelector:Selector) {
        self.removeTarget(nil, action: nil, for: .allEvents)
        self.addTarget(target, action: theSelector, for: UIControl.Event.touchUpInside)
    }
}
