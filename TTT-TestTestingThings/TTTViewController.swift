//
//  ViewController.swift
//  TTT-TestTestingThings
//
//  Created by KyungYoung Heo on 2021/12/03.
//

import UIKit

class TTTViewController: UIViewController {
    var viewModel: TTTViewModel
    
    init(viewModel: TTTViewModel) {
        self.viewModel = viewModel
            
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
    }
}
