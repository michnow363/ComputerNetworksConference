//
//  Presentations.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class PresentationEntity: Object {
    @objc dynamic var ID : Int = 0
    @objc dynamic var startDate : Date?
    @objc dynamic var endDate : Date?
    @objc dynamic var place : String?
    @objc dynamic var presentationDescription : String?
    @objc dynamic var title : String?
    //ids
    @objc dynamic var conferenceId : Int = 0
    @objc dynamic var presentationTypeId : Int = 0
    
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
