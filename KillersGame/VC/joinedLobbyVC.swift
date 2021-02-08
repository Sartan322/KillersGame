//
//  joinedLobbyVC.swift
//  KillersGame
//
//  Created by Павел Прокопьев on 08.02.2021.
//

import UIKit

class joinedLobbyVC: UIViewController {
    let dataManager: DataManger = DataManger.shared
    
    @IBOutlet weak var lobbyName: UILabel!
    @IBOutlet weak var countPlayersLabel: UILabel!
    @IBOutlet weak var playersButton: UIButton!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideNavigationBar()
        let lobby: Lobby = (dataManager.getUserWithLogin(with: UserData.login).first?.lobby)!
        lobbyName.text = lobby.name
        countPlayersLabel.text = (String(describing: lobby.getUsers()?.count))
        customizeLabel(labels: [lobbyName, informationLabel, countPlayersLabel])
        customizeButtons(buttons: [playersButton, cancelButton])
    }
    
    @IBAction func profileButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
