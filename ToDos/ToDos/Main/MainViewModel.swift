//
//  MainViewModel.swift
//  ToDos
//
//  Created by Artur Akulich on 21.09.24.
//

import Foundation

protocol MainViewModelProtocol: AnyObject {
    
}

final class MainViewModel: MainViewModelProtocol {
    
    private var model: MainModel
    
    init(model: MainModel) {
        self.model = model
    }
}
