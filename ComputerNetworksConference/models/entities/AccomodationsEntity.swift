//
//  Accomodations.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class AccommodationEntity: RealmEntity {
    @objc dynamic var address : String?
    @objc dynamic var name : String?
    @objc dynamic var number : String?
    @objc dynamic var website : String?
    
    
    required init(from decodable: Decodable) {
        super.init(from: decodable)
        if let decodable = decodable as? AccommodationDecodable {
            id = decodable.id
            address = decodable.address
            name = decodable.name
            number = decodable.number
            website = decodable.website
        }
    }
    
    required init() {
        super.init()
    }
}

