//
//  ContactCell.swift
//  ComputerNetworksConference
//
//  Created by Michal on 5/10/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit

class ContactCell: UITableViewCell{
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var university: UILabel!
    
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    func setCell(withEntity entity: OrganizerEntity){
        name.text = entity.lastName
        university.text = entity.affilation
        number.text = entity.contact
    }
}
