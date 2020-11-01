//
//  RateEntity.swift
//  ComputerNetworksConference
//
//  Created by Michal on 10/31/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class RateEntity: Object {
    @objc dynamic var ID : Int = 0
    @objc dynamic var rateDescription : String?
    @objc dynamic var rateValue : Int = 0
    //ids
    @objc dynamic var conferenceID : Int = 0
    @objc dynamic var presentationID : Int = 0
    @objc dynamic var userID : Int = 0
    @objc dynamic var rateCriterionID : Int = 0
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
