//
//  Emergency_numbers.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class EmergencyNumberEntity: RealmEntity {
    @objc dynamic var name : String?
    @objc dynamic var number : String?
    
    required init(from decodable: Decodable) {
            super.init(from: decodable)
            if let decodable = decodable as? EmergencyNumberDecodable {
                id = decodable.id
                name = decodable.name
                number = decodable.number
            }
        }
        
        required init() {
            super.init()
        }
}
