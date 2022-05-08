//
//  NewActivityViewController.swift
//  todo-list-app
//
//  Created by Amanda Detofol on 08/05/22.
//

import UIKit

class NewActivityViewController: UIViewController {
    
    private var newActivityView: NewActivityView = NewActivityView()
    var update: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    // MARK: Private methods
    private func setupView(){
        self.newActivityView.update = self.update
        self.view = newActivityView
    }
    
}
