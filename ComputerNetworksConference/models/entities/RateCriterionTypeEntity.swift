//
//  RateCriterionTypeEntity.swift
//  ComputerNetworksConference
//
//  Created by Michal on 10/31/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class RateCriterionTypeEntity : Object {
    @objc dynamic var ID : Int = 0
    @objc dynamic var name : String?
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
