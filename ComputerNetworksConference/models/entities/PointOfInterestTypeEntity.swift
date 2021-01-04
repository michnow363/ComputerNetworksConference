//
//  PointOfInterestTypeEntity.swift
//  ComputerNetworksConference
//
//  Created by Michal on 11/1/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class PointOfInterestTypeEntity: RealmEntity {
    @objc dynamic var name : String?
    @objc dynamic var pointOfInterestIconId : Int = 0
    required init(from decodable: Decodable) {
        super.init(from: decodable)
        if let decodable = decodable as? PointOfInterestTypeDecodable {
            id = decodable.id
            name = decodable.name
            pointOfInterestIconId = decodable.pointOfInterestIconID
        }
    }
    
    required init() {
        super.init()
    }
}
