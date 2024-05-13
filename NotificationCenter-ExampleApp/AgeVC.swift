//
//  AgeVC.swift
//  NotificationCenter-ExampleApp
//
//  Created by Marcos Fabian Chong Megchun on 08/05/24.
//

import UIKit

class AgeVC: UIViewController {

    let titleLabel = UILabel()
    let age = UILabel()
    
    var ageValue: String = "27"

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
        titleLabel.text = "Age is"
        
        view.addSubview(age)
        age.translatesAutoresizingMaskIntoConstraints = false
        age.text = ageValue
        age.font = .systemFont(ofSize: 30)
        age.textColor = .blue
        age.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            age.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            age.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            age.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
}
