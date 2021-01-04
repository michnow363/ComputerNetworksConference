//
//  PointOfInterestEntity.swift
//  ComputerNetworksConference
//
//  Created by Michal on 11/1/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class PointOfInterestEntity: RealmEntity {
    @objc dynamic var name : String?
    @objc dynamic var address : String?
    @objc dynamic var contact : String?
    @objc dynamic var pointOfInterestDescription : String?
    @objc dynamic var pointOfInterestTypeName : String?
    //ids
    @objc dynamic var pointOfInterestTypeId : Int = 0
    
    required init(from decodable: Decodable) {
        super.init(from: decodable)
        if let decodable = decodable as? PointOfInterestDecodable {
            id = decodable.id
            name = decodable.name
            address = decodable.address
            contact = decodable.description
            pointOfInterestDescription = decodable.description
            pointOfInterestTypeName = decodable.pointOfInterestTypeName
            pointOfInterestTypeId = decodable.pointOfInterestTypeID
        }
    }
    
    required init() {
        super.init()
    }
}
