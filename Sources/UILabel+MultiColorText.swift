//
//  UILabel+MultiColorText.swift
//  Djingo
//
//  Created by vdh on 22/05/2018.
//  Copyright © 2018 devrap. All rights reserved.
//

import UIKit

extension UILabel {
    
    public func setBonusColor(bonusColor: UIColor, coloredText: String) {
        if let text = self.text {
            let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: text)
            attributedString.setColorForText(textForAttribute: coloredText, withColor: bonusColor)
            self.attributedText = attributedString
        }
    }
    
    public func changeLabelWithFade(newText:String) {
        self.fadeOut(duration: 0.5, delay: 0) { (true) in
            self.text = newText
            self.fadeIn()
        }
    }
    
}
