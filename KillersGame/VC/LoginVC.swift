//
//  LoginVC.swift
//  KillersGame
//
//  Created by Павел Прокопьев on 06.02.2021.
//

import UIKit

class LoginVC: UIViewController {
    
    //MARK: - Fields
    
    let dataManager = DataManger.shared
    
    //MARK: - Outlets
    
    @IBOutlet weak var loginTextF: UITextField!
    @IBOutlet weak var passwordTextF: UITextField!
    
    //MARK: - Standart VC functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showNavigationBar()
    }
    
    //MARK: - Button Actions
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if (loginTextF.text?.isEmpty ?? true) || (passwordTextF.text?.isEmpty ?? true) {
            showEmptyAlert()
        } else {
            let user: [User]? = dataManager.checkAuth(withLogin: loginTextF.text!, withPassword: passwordTextF.text!)
            if user == nil {
                showErrorLoginAlert()
            } else {
                UserData.login = user![0].login
                UserData.password = user![0].password
                UserData.fullName = user![0].fullName
                performSegue(withIdentifier: "profileIdentifier", sender: self)
            }
        }
    }
    
    //MARK: - Allets
    
    private func showEmptyAlert(){
        let alert = UIAlertController(title: "Внимание", message: "Заполните поля", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(okBtn)
        present(alert, animated: true, completion: nil)
    }
    
    private func showErrorLoginAlert(){
        let alert = UIAlertController(title: "Внимание", message: "Не правильный логин или пароль", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(okBtn)
        present(alert, animated: true, completion: nil)
    }
}
