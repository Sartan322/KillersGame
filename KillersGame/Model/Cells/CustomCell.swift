//
//  CustomCell.swift
//  KillersGame
//
//  Created by Павел Прокопьев on 07.02.2021.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var lobbyNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func configure(lobbyNname: String){
        lobbyNameLabel.text = lobbyNname
    }
}
