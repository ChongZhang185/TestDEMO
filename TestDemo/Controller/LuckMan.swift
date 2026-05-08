//
//  LuckMan.swift
//  TestDemo
//
//  Created by chongzhang on 2026/5/6.
//

import Foundation

@objc
class LuckMan: NSObject {
    var name: String = ""
    
    @objc open func eat(food: String) {
        print("这个人 喜欢吃 \(food)")
    }
}
