//
//  SpeakersPhotos.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class SpeakerPhotoEntity: Object {
    @objc dynamic var ID : Int = 0
    @objc dynamic var path : String?
    @objc dynamic var speakerId : Int = 0
    
    override static func primaryKey() -> String? {
        return "speakerPhotoId"
    }
}
