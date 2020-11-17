//
//  UserRole.swift
//  ComputerNetworksConference
//
//  Created by Michal on 10/31/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class UserRoleEntity : Object {
    @objc dynamic var ID : Int = 0
    //ids
    @objc dynamic var userID : Int = 0
    @objc dynamic var roleID : Int = 0
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
