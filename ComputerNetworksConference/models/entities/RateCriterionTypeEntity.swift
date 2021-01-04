//
//  RateCriteria.swift
//  ComputerNetworksConference
//
//  Created by Michal on 10/31/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class RateCriterionTypeEntity : RealmEntity {
    @objc dynamic var name : String?
    
    required init(from decodable: Decodable) {
        super.init(from: decodable)
        if let decodable = decodable as? RateCriterionTypeDecodable {
            id = decodable.id
            name = decodable.name
        }
    }
    
    required init() {
        super.init()
    }
}
