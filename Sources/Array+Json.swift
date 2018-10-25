//
//  Array+Json.swift
//  Djingo
//
//  Created by DT on 25/10/2018.
//  Copyright © 2018 devrap. All rights reserved.
//

import Foundation

extension Array where Element: Encodable {
    
    public var jsonArray: [[String: Any]]? {
        let jsonArray = self.compactMap { elt -> [String: Any]? in
            return elt.jsonDict
        }
        
        guard self.count == jsonArray.count else {
            return nil
        }
        
        return jsonArray
    }
}

extension Array {
    mutating func appended(_ newElement: Element) -> [Element] {
        self.append(newElement)
        return self
    }
    
    mutating func prepend(_ newElement: Array.Element) {
        insert(newElement, at: 0)
    }
    
    public var indexedDictionary: [Int: Element] {
        var result: [Int: Element] = [:]
        enumerated().forEach { (entry: (offset: Int, element: Element)) in
            result[entry.offset] = entry.element
        }
        return result
    }
    
    func chunk(size: Int) -> [[Element]] {
        guard size > 0 else {
            return [self]
        }
        
        var this = self
        var chunks = [[Element]]()
        
        while this.count > 0 {
            let range = 0..<Swift.min(this.count, size)
            chunks.append(this[range].array)
            this.removeSubrange(range)
        }
        
        return chunks
    }
    
    func grouping<T: Hashable>(_ groupFor: ((Element) -> T)) -> [T: [Element]] {
        return Dictionary(grouping: self, by: { elt -> T in
            return groupFor(elt)
        })
    }
    
    func toDict<T>(key: (Element) -> T) -> [T: Element] {
        var dict = [T: Element]()
        forEach { elt in
            dict[key(elt)] = elt
        }
        return dict
    }
}

extension ArraySlice {
    var array: [Element] {
        return Array(self)
    }
}

extension Encodable {
    typealias JSONDict = [String: Any]
    var jsonDict: JSONDict? {
        guard let encodedObj = try? JSONEncoder().encode(self),
            let jsonDict = try? JSONSerialization.jsonObject(with: encodedObj, options: []) as? JSONDict else {
                return nil
        }
        return jsonDict
    }
}
