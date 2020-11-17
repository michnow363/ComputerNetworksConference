//
//  PresentationPhotoEntity.swift
//  ComputerNetworksConference
//
//  Created by Michal on 11/17/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class PresentationPhotoEntity: Object {
    @objc dynamic var ID : Int = 0
    @objc dynamic var path : String?
    @objc dynamic var isMain : Bool = true
    //ids
    @objc dynamic var presentationId : Int = 0
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
