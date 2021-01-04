//
//  PointOfInterestIcon.swift
//  ComputerNetworksConference
//
//  Created by Michal on 11/17/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class PointOfInterestIconEntity: RealmEntity {
    @objc dynamic var ID : Int = 0
    @objc dynamic var xmlContent : String?
    
    required init(from decodable: Decodable) {
            super.init(from: decodable)
            if let decodable = decodable as? PointOfInterestIconDecodable {
                id = decodable.id
                xmlContent = decodable.path
            }
        }
        
        required init() {
            super.init()
        }
}
