//
//  _42Feature.swift
//  SwiftVersionFeature
//
//  Created by ios on 2024/11/27.
//

import UIKit

class _42Feature: NSObject {

    // MARK: - @dynamicMemberLookup
    /// 动态查找成员属性，先找同名成员属性，找不到就会在`subscript(dynamicMember member: String)`中查找
    /// SE-0195 https://github.com/swiftlang/swift-evolution/blob/main/proposals/0195-dynamic-member-lookup.md
    @dynamicMemberLookup
    struct Person {
        
        let sex: Int
        
        subscript(dynamicMember member: String) -> String {
            let properties = ["name" : "peter", "hobby" : "basketball"]
            return properties[member, default: ""]
        }
        
        // 重载定义不同返回类型
        subscript(dynamicMember member: String) -> CGFloat? {
            let properties = ["age" : CGFloat(18.0), "height" : CGFloat(175.5)]
            return properties[member]
        }
    }

    func dynamicMemberLookupTest() {
        let p = Person(sex: 0)
        let u: CGFloat? = p.age
    }
    
    // MARK: - CaseIterable
    /// 继承该协议可以遍历所有枚举值
    enum PriorityLevel: CaseIterable {
        case userInitiated
        case userInteractive
    }
    
    func caseIterableTest() {
        for level in PriorityLevel.allCases {
            
        }
    }
    
    // MARK: - 随机数
    func randomTest() {
        let intRandom = Int.random(in: 0...10)
        let keys = ["a", "b", "c", "d"]
        // 随机获取一项
        print(keys.randomElement() ?? "")
        // 打乱随机获取一项
        print(keys.shuffled().randomElement() ?? "")
    }
    
    // MARK: - 目标平台
    func platformTest() {
        // 判断系统从而导包
        #if os(iOS) || os(watchOS) || os(tvOS)
//        import UIKit
        #else
//        import AppKit
        #endif
        
        // 判断是否能导包
        #if canImport(UIKit)
//        import UIKit
        #elseif canImport(AppKit)
//        import AppKit
        #else
        // 编译宏
        #error("")
        #warning("")
        #endif
    }
    
    // MARK: - 内存独占访问
    // Build Settings 搜 exclusive access to memory
    
    // MARK: - Hashable 的加强
    // https://juejin.cn/post/6844903618714271751#heading-16 不知道讲什么
}
