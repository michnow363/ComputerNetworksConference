//
//  ConferenceAccomodation.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class ConferenceAccommodationEntity: RealmEntity {
    //ids
    @objc dynamic var accommodationId : Int = 0
    @objc dynamic var conferenceId : Int = 0
    
    required init(from decodable: Decodable) {
        super.init(from: decodable)
        if let decodable = decodable as? ConferenceAccommodationDecodable {
            id = decodable.id
            accommodationId = decodable.accommodationID
            conferenceId = decodable.conferenceID
        }
    }
    
    required init() {
        super.init()
    }
}

