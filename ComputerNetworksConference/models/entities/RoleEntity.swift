//
//  RoleEntity.swift
//  ComputerNetworksConference
//
//  Created by Michal on 11/1/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class RoleEntity : Object {
    @objc dynamic var ID : Int = 0
    @objc dynamic var name : String?
    @objc dynamic var noramlisedName : String?
    @objc dynamic var concurrencyStamp : String?
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
