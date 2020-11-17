//
//  SpeakersPresentationsEntity.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class PresentationParticipantEntity: Object {
    @objc dynamic var ID : Int = 0
    @objc dynamic var presentationId : Int = 0
    @objc dynamic var participantId : Int = 0
    @objc dynamic var isAuthor : Bool = true
    @objc dynamic var isSpeaker : Bool = true
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
