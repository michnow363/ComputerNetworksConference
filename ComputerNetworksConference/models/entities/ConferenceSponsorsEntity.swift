//
//  ConferenceSponsorsEntity.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class ConferenceSponsorEntity: Object {
    @objc dynamic var ID : Int = 0
    //ids
    @objc dynamic var conferenceId : Int = 0
    @objc dynamic var sponsorId : Int = 0
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
