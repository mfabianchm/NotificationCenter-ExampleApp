//
//  ViewController.swift
//  NotificationCenter-ExampleApp
//
//  Created by Marcos Fabian Chong Megchun on 08/05/24.
//

import UIKit

struct UserInformation {
    var name: String
    var age: Int
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    let nameLabel = UILabel()
    let ageLabel = UILabel()
    let nameField = UITextField()
    let ageField = UITextField()
    let button = UIButton()
    
    let nameVC = NameVC()
    let ageVC = AgeVC()
    
    var nameValue: String?
    var ageValue: Int?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
        createObservers()
    }
    
    func configure() {
        self.title = "Main View Controller"
        
        let views = [nameLabel, ageLabel, nameField, ageField, button]
        
        views.forEach { viewToAdd in
            view.addSubview(viewToAdd)
            viewToAdd.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addVCChilds()
        
        nameLabel.text = "Name"
        ageLabel.text = "Age"
        
        nameField.borderStyle = .roundedRect
        ageField.borderStyle = .roundedRect
        nameField.delegate = self
        ageField.delegate = self
        nameField.keyboardType = .default
        ageField.keyboardType = .namePhonePad
        
        
        button.setTitle("Update Info", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(updateInformation), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            
            nameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            
            ageLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
            ageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            
            ageField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 20),
            ageField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ageField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            
            nameVC.view.topAnchor.constraint(equalTo: ageField.bottomAnchor, constant: 20),
            nameVC.view.widthAnchor.constraint(equalToConstant: 300),
            nameVC.view.heightAnchor.constraint(equalToConstant: 200),
            nameVC.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ageVC.view.topAnchor.constraint(equalTo: nameVC.view.bottomAnchor, constant: 20),
            ageVC.view.widthAnchor.constraint(equalToConstant: 300),
            ageVC.view.heightAnchor.constraint(equalToConstant: 200),
            ageVC.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.topAnchor.constraint(equalTo: ageVC.view.bottomAnchor, constant: 20),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 100),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            
        ])
    }
    
    func addVCChilds() {
        view.addSubview(nameVC.view)
        addChild(nameVC)
        nameVC.didMove(toParent: self)
        
        view.addSubview(ageVC.view)
        addChild(ageVC)
        ageVC.didMove(toParent: self)
    }
    
    
    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateName(_:)), name: Notification.Name.UpdateInfo, object: nil)
    }
    
    @objc func updateName (_ notification: Notification) {
        guard let user = notification.userInfo else {return}
        
        guard let userInfo = user["username"] as? UserInformation else {
            return
        }
        nameVC.name.text = userInfo.name
        ageVC.age.text = userInfo.age.description
    }
    
    @objc func updateInformation () {
        let user = UserInformation(name: self.nameValue ?? "Marcos", age: self.ageValue ?? 27)
        NotificationCenter.default.post(name: .UpdateInfo, object: nil, userInfo: ["username": user])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameField {
            self.nameValue = nameField.text
        } else {
            self.ageValue = Int(ageField.text!)
        }
        
        textField.resignFirstResponder()
        return true
    }

}

extension Notification.Name {
    static let UpdateInfo = Notification.Name("UpdateInfo")
}

