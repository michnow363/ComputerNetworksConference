//
//  RateEntity.swift
//  ComputerNetworksConference
//
//  Created by Michal on 10/31/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class RateEntity: RealmEntity {
    @objc dynamic var rateDescription : String?
    @objc dynamic var rateCriterionName : String?
    @objc dynamic var presentationName : String?
    @objc dynamic var conferenceName : String?
    @objc dynamic var rateValue : Int = 0
    //ids
    @objc dynamic var conferenceID : Int = 0
    @objc dynamic var presentationID : Int = 0
    @objc dynamic var userID : Int = 0
    @objc dynamic var rateCriterionID : Int = 0
    
    required init(from decodable: Decodable) {
        super.init(from: decodable)
        if let decodable = decodable as? RateDecodable {
            id = decodable.id
            rateDescription = decodable.description
            rateValue = decodable.value
            conferenceID = decodable.conferenceID
            presentationID = decodable.presentationID
            userID = decodable.mobileUserID
            rateCriterionID = decodable.rateCriterionID
            rateCriterionName = decodable.rateCriterionName
            presentationName = decodable.presentationName
            conferenceName = decodable.conferenceName
        }
    }
    
    required init() {
        super.init()
    }
}
