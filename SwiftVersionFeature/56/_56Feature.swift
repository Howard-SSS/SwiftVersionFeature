//
//  _56Feature.swift
//  SwiftVersionFeature
//
//  Created by ios on 2024/8/13.
//

import UIKit

class _56Feature: NSObject {

    func feature1() {
        
    }
    
    // 占位符类型推断
    // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0315-placeholder-types.md
    func feature2() {
        var dict: [_ : [Int]] = [
            "1" : [1, 2],
            "2" : [1, 2, 3]
        ]
    }
    
    enum OldSettings: String, Codable, CodingKeyRepresentable {
        case name
        case twitter
    }

    enum NewSettings: String, Codable {
        case name
        case twitter
    }
    
    // KeyedContainer
    // https://github.com/apple/swift-evolution/blob/main/proposals/0320-codingkeyrepresentable.mdKeyedContainer
    func feature3() {
        let oldDict: [OldSettings: String] = [.name: "Paul", .twitter: "@twostraws"]
        let oldData = try! JSONEncoder().encode(oldDict)
        print(String(decoding: oldData, as: UTF8.self)) // ["twitter","@twostraws","name","Paul"]
        
        let newDict: [NewSettings: String] = [.name: "Paul", .twitter: "@twostraws"]
        let newData = try! JSONEncoder().encode(newDict)
        print(String(decoding: newData, as: UTF8.self)) // {"twitter":"@twostraws","name":"Paul"}
    }
    
    // 版本不可用判断
    // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0290-negative-availability.md
    func feature4() {
        // iOS 14和更早的版本可用
        if #unavailable(iOS 15) {
            
        }
    }
    
    func feature5() {
        
    }
}
