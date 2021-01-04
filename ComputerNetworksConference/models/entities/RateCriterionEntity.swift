//
//  RateCriterionTypeEntity.swift
//  ComputerNetworksConference
//
//  Created by Michal on 10/31/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class RateCriterionEntity : RealmEntity {
    @objc dynamic var name : String?
    @objc dynamic var rateCriterionTypeName : String?
    //ids
    @objc dynamic var rateCriterionTypeID : Int = 0
    
    required init(from decodable: Decodable) {
        super.init(from: decodable)
        if let decodable = decodable as? RateCriterionDecodable {
            id = decodable.id
            name = decodable.name
            rateCriterionTypeName = decodable.rateCriterionTypeName
            rateCriterionTypeID = decodable.rateCriterionTypeID
        }
    }
    
    required init() {
        super.init()
    }
}
