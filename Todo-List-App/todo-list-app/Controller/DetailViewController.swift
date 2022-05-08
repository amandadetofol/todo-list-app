//
//  DetailViewController.swift
//  todo-list-app
//
//  Created by Amanda Detofol on 05/05/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var detailView: DetailView = DetailView()
    var viewModel: DetailViewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: Private methods
    private func setupView(){
        detailView.setupView(title: viewModel.todo ?? "")
        self.view = detailView
    }
    
}
