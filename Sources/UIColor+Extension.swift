//
//  UIColor+Extension.swift
//
//  Created by vdh on 05/07/2016.
//  Copyright © 2016 Orange. All rights reserved.
//

import UIKit

public extension UIColor {

    public convenience init(hex: Int) {
        self.init(hex: hex, alpha: 1)
    }

    public convenience init(hex: Int, alpha: Double) {
        self.init(red: CGFloat((hex >> 16) & 0xff) / 255, green: CGFloat((hex >> 8) & 0xff) / 255, blue: CGFloat(hex & 0xff) / 255, alpha: CGFloat(alpha))
    }

    var rgb: [CGFloat]? {
        var fRed: CGFloat = 0
        var fGreen: CGFloat = 0
        var fBlue: CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            return [fRed, fGreen, fBlue, fAlpha]
        } else {
            // Could not extract RGBA components:
            return nil
        }
    }

    var isDark: Bool {
        return isDark()
    }

    func isDark(withBrightnessLevel brightnessLevel: CGFloat = 0.4) -> Bool {
        if let components = self.rgb {
            let brightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000
            return brightness < brightnessLevel
        }

        return true
    }

    public class var gooseGrey: UIColor { return UIColor(hex: 0xD8D8D8) }
    public class var lightDimGrey: UIColor { return UIColor(hex: 0x4C4C4C) } //main text
    public class var lightCoral: UIColor { return UIColor(hex: 0xDC6474) } //error

    // Check Deposit Status
    public class var lightOrange: UIColor { return UIColor(hex: 0xF5A623) }
    public class var orangeOfficial: UIColor { return UIColor(hex: 0xFF7900) }
    public class var indianRed: UIColor { return UIColor(hex: 0xDD6676) }
    public class var lightAquaMarine: UIColor { return UIColor(hex: 0x28C3A9) }
}
