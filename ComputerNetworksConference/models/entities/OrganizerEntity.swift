//
//  OrganizersEntity.swift
//  ComputerNetworksConference
//
//  Created by Ola on 25/06/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class OrganizerEntity: Object {
    @objc dynamic var ID : Int = 0
    @objc dynamic var firstName : String?
    @objc dynamic var lastName : String?
    @objc dynamic var university : String?
    @objc dynamic var company : String?
    @objc dynamic var contact : String?
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
           
