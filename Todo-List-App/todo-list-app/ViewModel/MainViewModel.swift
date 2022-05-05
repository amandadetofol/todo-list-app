//
//  MainViewModel.swift
//  todo-list-app
//
//  Created by Amanda Detofol on 05/05/22.
//

import Foundation

class MainViewModel {
    
    var todoList: [String] = []
    var mainViewController: MainViewController
    
    init (mainViewController: MainViewController) {
        self.mainViewController = mainViewController
    }
    
}
