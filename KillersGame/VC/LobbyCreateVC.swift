//
//  LobbyCreateVC.swift
//  KillersGame
//
//  Created by Павел Прокопьев on 06.02.2021.
//

import UIKit

class LobbyCreateVC: UIViewController {
    
    let dataManager: DataManger = DataManger.shared
    
    @IBOutlet weak var creatingLabel: UILabel!
    @IBOutlet weak var lobbyNameLabel: UILabel!
    @IBOutlet weak var lobbyPasswordLabel: UILabel!
    @IBOutlet weak var lobbyNameTextF: UITextField!
    @IBOutlet weak var lobbyPasswordTextF: UITextField!
    @IBOutlet weak var createLobbyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showNavigationBar()
        customizeLabel(labels: [creatingLabel, lobbyNameLabel, lobbyPasswordLabel])
        customizeButtons(buttons: [createLobbyButton])
    
    }
    
    @IBAction func createButtonPressed(_ sender: Any) {
        if (lobbyNameTextF.text?.isEmpty ?? true) || (lobbyPasswordTextF.text?.isEmpty ?? true) {
            showEmptyAlert()
        } else {
            let user = dataManager.getUserWithLogin(with: UserData.login)
            dataManager.saveLobby(withName: lobbyNameTextF.text!, withPassword: lobbyPasswordTextF.text!, withUser: user.first!)
            //print("lobbys count after save = \(dataManager.getLobbys()?.count)")
            let vc = storyboard?.instantiateViewController(identifier: "profileIdentifier")
            self.navigationController?.pushViewController(vc!, animated: true)
            
            ///MARK: - Check relationships User and Labby
//            print(dataManager.getUserWithLogin(with: UserData.login).first?.lobby)
//            print(dataManager.getLobbyWithName(withName: lobbyNameTextF.text!)?.first?.lobbyId)
        }
    }
    
    private func showEmptyAlert(){
        let alert = UIAlertController(title: "Внимание", message: "Заполните поля", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(okBtn)
        present(alert, animated: true, completion: nil)
    }
    

}
