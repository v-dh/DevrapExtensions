//
//  UIView+FadeInOut.swift
//  Djingo
//
//  Created by vdh on 22/05/2018.
//  Copyright © 2018 devrap. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    public func fadeIn(duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.alpha = 1.0
            }, completion: completion)
        }
        
    public func fadeOut(duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.alpha = 0.0
            }, completion: completion)
        }
    
    public var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    public func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
    
    // AdSubview for mainPage
    public func addSubviewWithFullSizeConstraints(view : UIView) {
        insertSubviewWithFullSizeConstraints(view: view, atIndex: subviews.count)
    }
    
    public func insertSubviewWithFullSizeConstraints(view : UIView, atIndex: Int) {
        view.translatesAutoresizingMaskIntoConstraints = false
        insertSubview(view, at: atIndex)
        
        let top = view.topAnchor.constraint(equalTo: self.topAnchor)
        let leading = view.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let trailing = self.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let bottom = self.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        NSLayoutConstraint.activate([top, leading, trailing, bottom])
    }
    
}
