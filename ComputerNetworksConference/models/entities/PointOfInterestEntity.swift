//
//  PointOfInterestEntity.swift
//  ComputerNetworksConference
//
//  Created by Michal on 11/1/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class PointOfInterestEntity: Object {
    @objc dynamic var ID : Int = 0
    @objc dynamic var name : String?
    @objc dynamic var address : String?
    @objc dynamic var contact : String?
    @objc dynamic var pointOfInterestDescription : String?
    //ids
    @objc dynamic var pointOfInterestTypeId : Int = 0
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
