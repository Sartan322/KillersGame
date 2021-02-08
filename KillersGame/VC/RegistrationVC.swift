//
//  RegistrationVC.swift
//  KillersGame
//
//  Created by Павел Прокопьев on 05.02.2021.
//

import UIKit

class RegistrationVC: UIViewController {
    
    let dataManager: DataManger = DataManger.shared
    
    @IBOutlet weak var loginTextF: UITextField!
    @IBOutlet weak var passwordTextF: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showNavigationBar()
        customizeTextField(textFields: [loginTextF, passwordTextF, nameTextField])
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        print("aaaa")
        dataManager.saveUser(login: loginTextF.text!, password: passwordTextF.text!, name: nameTextField.text!)
        
        UserData.login = loginTextF.text
        UserData.password = passwordTextF.text
        UserData.fullName = nameTextField.text
        
        
        navigationController?.popViewController(animated: true)
        
    }
}
