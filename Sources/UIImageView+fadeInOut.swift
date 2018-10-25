//
//  UIImageView+fadeInOut.swift
//  Djingo
//
//  Created by vdh on 04/06/2018.
//  Copyright © 2018 devrap. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func displayImageWithFade(imageName:String) {
        self.fadeOut(duration: 0.5, delay: 0) { (true) in
            self.image = UIImage(named: imageName)
            self.fadeIn()
        }
    }
    
    func sizeToImage() {
        //Grab loc
        let xC = self.center.x;
        let yC = self.center.y;
        
        //Size to fit
        self.frame  = CGRect (x: 0, y: 0, width: (self.image?.size.width)!/2, height: (self.image?.size.height)!/2);
        
        //Move to loc
        self.center = CGPoint(x:xC, y:yC);
        
        return;
    }
}
