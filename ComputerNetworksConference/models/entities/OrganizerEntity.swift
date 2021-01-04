//
//  OrganizersEntity.swift
//  ComputerNetworksConference
//
//  Created by Ola on 25/06/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class OrganizerEntity: RealmEntity {
    @objc dynamic var firstName : String?
    @objc dynamic var lastName : String?
    @objc dynamic var affilation : String?
    @objc dynamic var company : String?
    @objc dynamic var contact : String?
    
    required init(from decodable: Decodable) {
            super.init(from: decodable)
            if let decodable = decodable as? OrganizerDecodable {
                id = decodable.id
                firstName = decodable.firstName
                lastName = decodable.lastName
                affilation = decodable.affiliation
                company = decodable.company
                contact = decodable.contact
            }
        }
        
        required init() {
            super.init()
        }
}
           
