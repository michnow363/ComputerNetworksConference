//
//  OrganizerCell.swift
//  ComputerNetworksConference
//
//  Created by Michal Nowak on 02/01/2021.
//  Copyright © 2021 OtherCoders. All rights reserved.
//

import UIKit

class OrganizerCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var affilationLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    
    func setCell(with entity: OrganizerEntity) {
        nameLabel.text = (entity.firstName ?? "") + " " + (entity.lastName ?? "")
        affilationLabel.text = entity.affilation
        companyLabel.text = entity.company
        contactLabel.text = entity.contact
    }
}
