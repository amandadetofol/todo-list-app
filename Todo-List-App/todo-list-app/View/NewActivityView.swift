//
//  NewActivityView.swift
//  todo-list-app
//
//  Created by Amanda Detofol on 08/05/22.
//

import UIKit

class NewActivityView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .darkGray
        label.text = "New Activity"
        return label
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Title"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleTapSaveButtonForTouchUpInside), for: .touchUpInside)
        return button
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var update: (() -> Void)?
    
    init(){
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.setupView()
        self.setupConstrains()
    }
    
    // MARK: Private methods
    private func setupView(){
        self.addSubview(titleLabel)
        self.addSubview(titleTextField)
        self.addSubview(saveButton)
    }
    
    private func setupConstrains(){
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            
            self.titleTextField.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 32),
            self.titleTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.titleTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.titleTextField.heightAnchor.constraint(equalToConstant: 48),

            self.saveButton.topAnchor.constraint(equalTo: self.titleTextField.bottomAnchor, constant: 32),
            self.saveButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.saveButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.saveButton.heightAnchor.constraint(equalToConstant: 48),
            
        ])
    }
    
}

extension NewActivityView {
    
    @objc func handleTapSaveButtonForTouchUpInside(){
        guard let titleText = self.titleTextField.text,
              let count = UserDefaults().value(forKey: "count") as? Int else { return }
        
        UserDefaults().set(count + 1, forKey: "count")
        UserDefaults().set(titleText, forKey: "task_\(count + 1)")
        update?()
        self.saveButton.backgroundColor = .green
    }
    
}
