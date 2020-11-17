//
//  PointOfInterestIcon.swift
//  ComputerNetworksConference
//
//  Created by Michal on 11/17/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class PointOdInterestIconEntity: Object {
    @objc dynamic var ID : Int = 0
    @objc dynamic var xmlContent : String?
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
