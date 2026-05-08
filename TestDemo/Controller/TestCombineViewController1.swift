//
//  TestCombineViewController.swift
//  TestDemo
//
//  Created by chongzhang on 2026/5/6.
//

import Foundation
import UIKit
import Combine

class TestCombineViewController1: UIViewController {
    
    private var cancellables = Set<AnyCancellable>()
    private let searchTextSubject = PassthroughSubject<String, Never>()
    let p = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCombineExample()

        p.testGCD()
        
        
        
        
    }
    
    private func setupCombineExample() {
        let textField = UITextField()
        textField.placeholder = "输入搜索内容"
        textField.borderStyle = .roundedRect
        textField.frame = CGRect(x: 20, y: 100, width: UIScreen.main.bounds.width - 40, height: 44)
        view.addSubview(textField)
        
        let resultLabel = UILabel()
        resultLabel.frame = CGRect(x: 20, y: 160, width: UIScreen.main.bounds.width - 40, height: 30)
        resultLabel.text = "等待输入..."
        view.addSubview(resultLabel)
        
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        searchTextSubject
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { "搜索: \($0)" }
            .sink { [weak resultLabel] result in
                resultLabel?.text = result
            }
            .store(in: &cancellables)
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        searchTextSubject.send(textField.text ?? "")
    }
}
