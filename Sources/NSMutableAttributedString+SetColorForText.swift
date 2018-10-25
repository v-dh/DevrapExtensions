//
//  NSMutableAttributedString+SetColorForText.swift
//  Djingo
//
//  Created by vdh on 22/05/2018.
//  Copyright © 2018 devrap. All rights reserved.
//
import Foundation
import UIKit

extension NSMutableAttributedString {
    
    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    
}
