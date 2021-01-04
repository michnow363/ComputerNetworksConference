//
//  Sponsors.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class SponsorEntity: RealmEntity {
    @objc dynamic var country : String?
    @objc dynamic var sponsorsDescription : String?
    @objc dynamic var logoPath : String?
    @objc dynamic var name : String?
    @objc dynamic var website : String?
    
    required init(from decodable: Decodable) {
        super.init(from: decodable)
        if let decodable = decodable as? SponsorDecodable {
            id = decodable.id
            country = decodable.country
            sponsorsDescription = decodable.description
            logoPath = decodable.logoPath
            name = decodable.name
            website = decodable.website
        }
    }
    
    required init() {
        super.init()
    }
}
