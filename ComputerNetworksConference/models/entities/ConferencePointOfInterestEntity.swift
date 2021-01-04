//
//  ConferencePointOfInterestEntity.swift
//  ComputerNetworksConference
//
//  Created by Michal on 11/1/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class ConferencePointOfInterestEntity: RealmEntity {
    @objc dynamic var conferenceId : Int = 0
    @objc dynamic var pointOfInterestId : Int = 0
    
    required init(from decodable: Decodable) {
        super.init(from: decodable)
        if let decodable = decodable as? ConferencePointOfInterestDecodable {
            id = decodable.id
            conferenceId = decodable.conferenceID
            pointOfInterestId = decodable.pointOfInterestID
        }
    }
    
    required init() {
        super.init()
    }
}
