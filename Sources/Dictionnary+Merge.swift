//
//  Dictionnary+Merge.swift
//  Djingo
//
//  Created by vdh on 20/07/2018.
//  Copyright © 2018 devrap. All rights reserved.
//

import Foundation

extension Dictionary {
    
    mutating func merge(with dictionary: Dictionary) {
        dictionary.forEach { updateValue($1, forKey: $0) }
    }
    
    func merged(with dictionary: Dictionary) -> Dictionary {
        var dict = self
        dict.merge(with: dictionary)
        return dict
    }
}
