//
//  ProfileVC.swift
//  KillersGame
//
//  Created by Павел Прокопьев on 06.02.2021.
//

import UIKit

class ProfileVC: UIViewController {
    
    //MARK: - Fields
    
    let dataManager: DataManger = DataManger.shared
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var killsLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    
    //MARK: - Standart VC functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideNavigationBar()
        enterFields()
        customizeLabel(labels: [fullNameLabel, loginLabel, killsLabel, deathsLabel, winsLabel])
//        print("lobbys count = \(dataManager.getLobbys())")
    }
    
    private func enterFields(){
        loginLabel.text = UserData.login
        fullNameLabel.text = UserData.fullName
        let statistics: Statistic = dataManager.getStatistics(withLogin: UserData.login)
        killsLabel.text = "\(statistics.kills)"
        deathsLabel.text = "\(statistics.deaths)"
        winsLabel.text = "\(statistics.wins)"
//        print(dataManager.getUserWithName(with: "pasha"))
//        print("lobby aa3 = \(dataManager.getLobbyWithName(withName: "aa3"))")
    }
    
    
    @IBAction func lobbyButtonPressed(_ sender: Any) {
        let lobby = dataManager.getUserWithLogin(with: UserData.login).first?.lobby
        if lobby != nil {
            let vc = storyboard?.instantiateViewController(identifier: "joinedLobbtIdentifier")
            self.navigationController?.pushViewController(vc!, animated: true)
        } else {
            let vc = storyboard?.instantiateViewController(identifier: "lobbysTableIdentifier")
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        
    }
    
}
