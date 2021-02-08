//
//  LobbysVC.swift
//  KillersGame
//
//  Created by Павел Прокопьев on 07.02.2021.
//

import UIKit

class LobbysVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let dataManager: DataManger = DataManger.shared
    
    @IBOutlet weak var createLobbyButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        customizeButtons(buttons: [createLobbyButton])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let lobbys = dataManager.getLobbys()
        
        guard lobbys != nil else {
            return 0
        }
        return lobbys!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let lobby = dataManager.lobbyFetchResultController.object(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CustomCell
        cell.configure(lobbyNname: lobby.name!)
        return cell
    }
    
    
    
}
