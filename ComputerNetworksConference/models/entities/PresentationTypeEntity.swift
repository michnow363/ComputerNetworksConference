//
//  Presentation_types.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class PresentationTypeEntity: RealmEntity {
    @objc dynamic var presentationTypeDescription : String?
    @objc dynamic var name : String?
   
    required init(from decodable: Decodable) {
        super.init(from: decodable)
        if let decodable = decodable as? PresentationTypeDecodable {
            id = decodable.id
            presentationTypeDescription = decodable.description
            name = decodable.name
        }
    }
    
    required init() {
        super.init()
    }
}
