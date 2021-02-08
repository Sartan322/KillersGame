//
//  VCExtencions.swift
//  KillersGame
//
//  Created by Павел Прокопьев on 29.01.2021.
//

import Foundation
import UIKit

extension UIViewController {
    //MARK: - NavBar Show and Hide
    
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //MARK: - Add Border to UILabels
    
    func customizeLabel(labels: [UILabel]) {
        for label in labels {
            label.layer.borderColor = UIColor.black.cgColor
            label.layer.borderWidth = 1
            label.layer.cornerRadius = 10
        }
    }
    
    func customizeTextField(textFields: [UITextField]) {
        for textField in textFields {
            textField.layer.borderWidth = 1
            textField.layer.cornerRadius = 10
        }
    }
    
    func customizeButtons(buttons: [UIButton]) {
        for button in buttons {
            button.layer.cornerRadius = 10
        }
    }
}
