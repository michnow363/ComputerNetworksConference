//
//  Users.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class UserEntity: Object {
    @objc dynamic var ID : Int = 0
    @objc dynamic var userName : String?
    @objc dynamic var noramlisedUserName : String?
    @objc dynamic var email : String?
    @objc dynamic var normalisedEmail : String?
    @objc dynamic var emailConfirmed : Bool = false
    @objc dynamic var passwordHash : String?
    @objc dynamic var securityStamp : String?
    @objc dynamic var concurrencyStamp : String?
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
