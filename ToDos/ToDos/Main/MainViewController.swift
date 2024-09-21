//
//  MainViewController.swift
//  ToDos
//
//  Created by Artur Akulich on 21.09.24.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    private var viewModel: MainViewModelProtocol
    
    // MARK: - Init
    init(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
