//
//  SpeakersPhotos.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class ParticipantPhotoEntity: RealmEntity {
    @objc dynamic var path : String?
    @objc dynamic var participantId : Int = 0
    
    required init(from decodable: Decodable) {
        super.init(from: decodable)
        if let decodable = decodable as? ParticipantPhotoDecodable {
            id = decodable.id
            path = decodable.path
            participantId = decodable.participantID
        }
    }
    
    required init() {
        super.init()
    }
}
