//
//  _57Feature.swift
//  SwiftVersionFeature
//
//  Created by ios on 2024/8/13.
//

import UIKit

class _57Feature: NSObject {

    // 解可选包
    // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0345-if-let-shorthand.md
    func feature1() {
        var name: String? = "Good morning"
//        if let name = name {
//        }
        if let name {
            print(name)
        }
        
//        guard let name = name else {
//            return
//        }
        guard let name else {
            return
        }
    }
    
    // 闭包输入输出不需指定类型
    // https://github.com/apple/swift-evolution/blob/main/proposals/0326-extending-multi-statement-closure-inference.md
    func feature2() {
        let scores = [11, 22, 33]
//        _ = scores.map { score -> Int in
//            score * score
//        }
        _ = scores.map({ score in
            score * score
        })
    }
    
    func feature3() {
//        Task.sleep(<#T##duration: UInt64##UInt64#>)
    }
    
    // 新 regex 代替 NSRegularExpression
    // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0350-regex-type-overview.md
    @available(iOS 16.0, *)
    func feature4() {
        let words = "This kis a cat, no bis a hat"
        do {
            let regex = try Regex("[ch]at")
            print(words.replacing(regex, with: "dog"))
        } catch {}
        
        let regex2 = /([a-z]*+is)/
        if let result = try? regex2.wholeMatch(in: words) {
            print(result)
        }
    }
    
    func feature5() {
        func kk<T: Sequence>(options: T = 1...49) {
            
        }
    }
}
