//
//  SpeakersCell.swift
//  ComputerNetworksConference
//
//  Created by vagrant on 23/04/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit

class SpeakersCell : UITableViewCell {
    @IBOutlet weak var personalInfoLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    
    func setCell(withEntity entity: ParticipantEntity) {
        personalInfoLabel.text = entity.firstName
        if(personalInfoLabel.text != nil) {
            personalInfoLabel.text! += " "
            personalInfoLabel.text! += entity.lastName ?? ""
        } else {
            personalInfoLabel.text = entity.lastName
        }
        universityLabel.text = entity.company
    }
}
