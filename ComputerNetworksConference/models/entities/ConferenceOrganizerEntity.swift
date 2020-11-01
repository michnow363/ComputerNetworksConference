//
//  ConferenceOrganizerEntity.swift
//  ComputerNetworksConference
//
//  Created by Michal on 11/1/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class ConferenceOrganizerEntity: Object {
    @objc dynamic var ID : Int = 0
    //ids
    @objc dynamic var conferenceId : Int = 0
    @objc dynamic var organizerId : Int = 0
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
