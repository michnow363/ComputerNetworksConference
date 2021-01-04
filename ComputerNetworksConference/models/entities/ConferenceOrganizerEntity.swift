//
//  ConferenceOrganizerEntity.swift
//  ComputerNetworksConference
//
//  Created by Michal on 11/1/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class ConferenceOrganizerEntity: RealmEntity {
    
    @objc dynamic var conferenceId : Int = 0
    @objc dynamic var organizerId : Int = 0
    
    required init(from decodable: Decodable) {
        super.init(from: decodable)
        if let decodable = decodable as? ConferenceOrganizerDecodable {
            id = decodable.id
            conferenceId = decodable.conferenceID
            organizerId = decodable.organizerID
        }
    }
    
    required init() {
        super.init()
    }
}
