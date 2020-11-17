//
//  Speakers.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class ParticipantEntity: Object {
    @objc dynamic var ID : Int = 0
    @objc dynamic var company : String?
    @objc dynamic var affilation : String?
    @objc dynamic var country : String?
    @objc dynamic var speakerDescription : String?
    @objc dynamic var firstName : String?
    @objc dynamic var lastName : String?
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
