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
}
