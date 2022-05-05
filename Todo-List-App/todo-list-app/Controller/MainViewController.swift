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
    }
    
    //MARK: Private methods
    private func setupTodoListTableView() {
        self.view.addSubview(todoListTableView)
    }
}



extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
