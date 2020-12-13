//
//  MessageViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 12/9/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import UIKit
import InputBarAccessoryView

class MessageViewController: UIViewController, InputBarAccessoryViewDelegate {
    
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
