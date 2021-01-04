//
//  ConferenceEmergencyNumbers.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class ConferenceEmergencyNumberEntity: RealmEntity {
    @objc dynamic var conferenceId : Int = 0
    @objc dynamic var emergencyNumberId : Int = 0
    
    required init(from decodable: Decodable) {
        super.init(from: decodable)
        if let decodable = decodable as? ConferenceEmergencyNumberDecodable {
            id = decodable.id
            conferenceId = decodable.conferenceID
            emergencyNumberId = decodable.emergencyNumberID
        }
    }
    
    required init() {
        super.init()
    }
}

