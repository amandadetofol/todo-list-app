//
//  DetailViewController.swift
//  todo-list-app
//
//  Created by Amanda Detofol on 08/05/22.
//

import UIKit

class DetailView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private let todoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "todo-icon")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(){
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.setupView()
        self.setupConstraints()
    }
    
    func setupView(title: String) {
        self.titleLabel.text = title.uppercased()
    }
    
    //MARK: Private method
    private func setupView(){
        self.addSubview(titleLabel)
        self.addSubview(todoImage)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            
            todoImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            todoImage.heightAnchor.constraint(equalToConstant: 60),
            todoImage.widthAnchor.constraint(equalToConstant: 60),
            todoImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            todoImage.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
        ])
    }
    
}
