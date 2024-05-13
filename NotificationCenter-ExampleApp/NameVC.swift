//
//  NameVC.swift
//  NotificationCenter-ExampleApp
//
//  Created by Marcos Fabian Chong Megchun on 08/05/24.
//

import UIKit

class NameVC: UIViewController {
    
    let titleLabel = UILabel()
    var name = UILabel()
    
    var nameValue: String = "Marcos"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        configure()
    }
    
    func configure() {
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Name is"
        
        view.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = nameValue
        name.font = .systemFont(ofSize: 30)
        name.textColor = .blue
        name.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            name.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    

}
