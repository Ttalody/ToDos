//
//  MainBuilder.swift
//  ToDos
//
//  Created by Artur Akulich on 21.09.24.
//

import UIKit

final class MainBuilder {
    static func build() -> UIViewController {
        let model: MainModel = .init()
        let viewModel: MainViewModel = .init(model: model)
        let viewController: MainViewController = .init(viewModel: viewModel)
        
        return viewController
    }
}
