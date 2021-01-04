//
//  ConferenceSponsorsEntity.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class ConferenceSponsorEntity: RealmEntity {
    @objc dynamic var conferenceId : Int = 0
    @objc dynamic var sponsorId : Int = 0
    
    required init(from decodable: Decodable) {
        super.init(from: decodable)
        if let decodable = decodable as? ConferenceSponsorDecodable {
            id = decodable.id
            conferenceId = decodable.conferenceID
            sponsorId = decodable.sponsorID
        }
    }
    
    required init() {
        super.init()
    }
}
