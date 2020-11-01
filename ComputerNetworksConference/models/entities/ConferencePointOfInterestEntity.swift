//
//  ConferencePointOfInterestEntity.swift
//  ComputerNetworksConference
//
//  Created by Michal on 11/1/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class ConferencePointOfInterestEntity: Object {
    @objc dynamic var ID : Int = 0
    @objc dynamic var conferenceId : Int = 0
    @objc dynamic var pointOfInterestId : Int = 0
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
