//
//  ViewController.swift
//  KillersGame
//
//  Created by Павел Прокопьев on 29.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    let dataManager = DataManger.shared
    //MARK: - Fields
    @IBOutlet weak var gameNameLabel: UILabel!
    
    
    //MARK: - Standart func
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideNavigationBar()
        customizeButtons(buttons: [logInButton, signUpButton])
        if UserData.login != nil {
            performSegue(withIdentifier: "profileIdentifier", sender: self)
            
        }
        
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "loginIdentifier", sender: self)
        
    }
    
    

}

