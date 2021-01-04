//
//  ConferenceEntity.swift
//  ComputerNetworksConference
//
//  Created by Michal on 5/28/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class ConferenceEntity: RealmEntity {
    @objc dynamic var address : String?
    @objc dynamic var country : String?
    @objc dynamic var confDescription : String?
    @objc dynamic var endDate : Date?
    @objc dynamic var startDate : Date?
    @objc dynamic var title : String?
    @objc dynamic var socialMedia : String?
    @objc dynamic var photoPath : String?
    
    required init(from decodable: Decodable) {
        super.init(from: decodable)
        if let decodable = decodable as? ConferenceDecodable {
            id = decodable.id
            address = decodable.address
            confDescription = decodable.description
            endDate = GlobalVariables.inFormatter.date(from: decodable.endDate)
            startDate = GlobalVariables.inFormatter.date(from: decodable.startDate)
            title = decodable.title
            socialMedia = decodable.socialMedia
            photoPath = decodable.photo
        }
    }
    
    required init() {
        super.init()
    }
}
