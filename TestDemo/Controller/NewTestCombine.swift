//
//  NewTestCombine.swift
//  TestDemo
//
//  Created by chongzhang on 2026/5/8.
//

import Foundation
import UIKit
import Combine

class NewTestCombine: UIViewController {
    
    // 创建一个 PassthroughSubject 发布者
    let publisher = PassthroughSubject<Int, Never>()
//    private var cancellables = Set<AnyCancellable>()
    private var testSubs: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton()
    }
    
    func addButton() {
        let button = UIButton.init(type: .custom)
        button.setTitle("点击", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.frame = CGRect(x: 100, y: 200, width: 100, height: 60)
        button.addTarget(self, action: #selector(testBtnAction), for: .touchUpInside)
        view.addSubview(button)
        
        testSubs = publisher
        .filter { $0 % 2 == 0 }
        .map { $0 * 10 }
        .sink { value in
            print("===========\(value)")
        }
//        .store(in: &cancellables)
        view.backgroundColor = .white
    }
    
    @objc
    func testBtnAction() {
        publisher.send(1)
        publisher.send(2)
        publisher.send(3)
        publisher.send(4)
    }
    
}
