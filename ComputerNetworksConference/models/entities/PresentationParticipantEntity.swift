//
//  SpeakersPresentationsEntity.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class PresentationParticipantEntity: RealmEntity {
    @objc dynamic var presentationId : Int = 0
    @objc dynamic var participantId : Int = 0
    @objc dynamic var isAuthor : Bool = true
    @objc dynamic var isSpeaker : Bool = true
    
    required init(from decodable: Decodable) {
        super.init(from: decodable)
        if let decodable = decodable as? PresentationParticipantDecodable {
            id = decodable.id
            presentationId = Int(decodable.presentationID)!
            participantId = decodable.participantID
        }
    }
    
    required init() {
        super.init()
    }
}
