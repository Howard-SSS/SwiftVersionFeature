//
//  _50Feature.swift
//  SwiftVersionFeature
//
//  Created by ios on 2024/11/28.
//

import UIKit

class _50Feature: NSObject {

    // MARK: - SE-0200 https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2Fapple%2Fswift-evolution%2Fblob%2Fmaster%2Fproposals%2F0200-raw-string-escaping.md
    /// 字符串对"使用的解放
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
}
