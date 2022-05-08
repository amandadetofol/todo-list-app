//
//  ViewController.swift
//  todo-list-app
//
//  Created by Amanda Detofol on 05/05/22.
//

import UIKit

enum ReusableIdentifiers: String {
    case maintodoListTableViewCellIdentifier = "maintodoListTableViewCellIdentifier"
}

class MainViewController: UIViewController {
    
    lazy var mainViewModel: MainViewModel = MainViewModel(mainViewController: self)

    private lazy var todoListTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: ReusableIdentifiers.maintodoListTableViewCellIdentifier.rawValue)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.todoListTableView.frame = self.view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTodoListTableView()
        self.setupNavigationBar()
        self.setupUserDefaultConfigurations()
        self.updateTasks()
    }
    
    //MARK: Private methods
    private func setupTodoListTableView() {
        self.view.addSubview(todoListTableView)
    }
    
    private func setupUserDefaultConfigurations(){
        let userDefaults = UserDefaults()
        if !userDefaults.bool(forKey: "setup") {
            userDefaults.set(true, forKey: "setup")
            userDefaults.set(0, forKey: "count")
        }
    }
        
    private func setupNavigationBar(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(handleAddNewTap))
    }
    
    func updateTasks(){
        
        mainViewModel.todoList.removeAll()
        
        guard let count = UserDefaults().object(forKey: "count") as? Int else { return }
    
        for todoItem in 0...count {
            if let task = UserDefaults().object(forKey: "task_\(todoItem+1)") as? String {
                self.mainViewModel.todoList.append(task)
            }
        }
        self.todoListTableView.reloadData()
       
    }

}

extension MainViewController {
    
    @objc func handleAddNewTap(){
        let viewController = NewActivityViewController()
        viewController.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

