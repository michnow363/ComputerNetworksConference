//
//  Accomodations.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class AccommodationEntity: Object {
    @objc dynamic var ID : Int = 0
    @objc dynamic var address : String?
    @objc dynamic var name : String?
    @objc dynamic var number : String?
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}

