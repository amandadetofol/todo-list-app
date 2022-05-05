//
//  MainViewController + UiTableViewDataSource.swift
//  todo-list-app
//
//  Created by Amanda Detofol on 05/05/22.
//

import UIKit

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My Todo List"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReusableIdentifiers.maintodoListTableViewCellIdentifier.rawValue,
                                                 for: indexPath)
        cell.textLabel?.text = mainViewModel.todoList[indexPath.row]
        return cell
    }
    
    
}
