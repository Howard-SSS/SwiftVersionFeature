//
//  _50Feature.swift
//  SwiftVersionFeature
//
//  Created by ios on 2024/11/28.
//

import UIKit

class _50Feature: NSObject {

    // MARK: - 字符串对"使用的解放
    ///SE-0200 https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2Fapple%2Fswift-evolution%2Fblob%2Fmaster%2Fproposals%2F0200-raw-string-escaping.md
    func stringTest() {
        // 字符串内"需要转义
        let str1 = "123\"123\(123)"
        // 字符串内"不需要转义
        let str2 = #"123"123\#(123)"#
        // 字符串内"和#不需要转义
        let str3 = ##"123"123"#\##(123)"## // 123"123"#123
        let str4 = #"""
        """#
    }
    
    // MARK: - dynamicCallable
    /// SE-0216 https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2Fapple%2Fswift-evolution%2Fblob%2Fmaster%2Fproposals%2F0216-dynamic-callable.md
    /// 应用于结构、类、枚举和协议，dynamicMemberLookup 是对属性使用的拓展，dynamicCallable 是对函数使用的拓展
    @dynamicCallable
    struct Person {
        
        @discardableResult
        func dynamicallyCall(withArguments args: [Float]) -> Float {
            let sum = args.reduce(0.0) { partialResult, score in
                partialResult + score
            }
            return sum / Float(args.count)
        }
        
        @discardableResult
        func dynamicallyCall(withKeywordArguments args: KeyValuePairs<String, [Float]>) -> [String : Float] {
            var ret: [String : Float] = [:]
            for (name, scores) in args {
                let sum = scores.reduce(0.0) { partialResult, score in
                    partialResult + score
                }
                ret[name] = Float(sum) / Float(scores.count)
            }
            return ret
        }
    }
    
    func dynamicCallableTest() {
        let p = Person()
        // p.dynamicallyCall(withArguments: [20, 30, 40])
        p(20, 30, 40)
        // p.dynamicallyCall(withKeywordArguments: [wangming ：[30.0, 33.0, 28.0]])
        p(wangming: [30.0, 33.0, 28.0])
    }
    
}
