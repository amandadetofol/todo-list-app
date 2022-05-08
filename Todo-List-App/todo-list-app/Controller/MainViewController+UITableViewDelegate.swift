//
//  MainViewController+UITableViewDelegate.swift
//  todo-list-app
//
//  Created by Amanda Detofol on 08/05/22.
//

import UIKit

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailViewController = DetailViewController()
        detailViewController.viewModel.todo =  mainViewModel.todoList[indexPath.row]
        
        self.navigationController?.present(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        UserDefaults().removeObject(forKey: "task_\(indexPath.row+1)")
        self.updateTasks()
    }
    
}
