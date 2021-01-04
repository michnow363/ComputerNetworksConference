//
//  Speakers.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class ParticipantEntity: RealmEntity {
    @objc dynamic var company : String?
    @objc dynamic var affiliation : String?
    @objc dynamic var country : String?
    @objc dynamic var speakerDescription : String?
    @objc dynamic var firstName : String?
    @objc dynamic var lastName : String?
    @objc dynamic var photoPath : String?
    
    required init(from decodable: Decodable) {
            super.init(from: decodable)
            if let decodable = decodable as? ParticipantDecodable {
                id = decodable.id
                company = decodable.company
                affiliation = decodable.affiliation
                country = decodable.country
                speakerDescription = decodable.description
                firstName = decodable.firstName
                lastName = decodable.lastName
                photoPath = decodable.photo
            }
        }
        
        required init() {
            super.init()
        }
    
    
}
