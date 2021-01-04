//
//  Presentations.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class PresentationEntity: RealmEntity {
    @objc dynamic var startDate : Date?
    @objc dynamic var endDate : Date?
    @objc dynamic var place : String?
    @objc dynamic var authors : String?
    @objc dynamic var presentationDescription : String?
    @objc dynamic var title : String?
    //ids
    @objc dynamic var conferenceId : Int = 0
    @objc dynamic var presentationTypeId : Int = 0
    
    
    required init(from decodable: Decodable) {
        super.init(from: decodable)
        if let decodable = decodable as? PresentationDecodable {
            id = decodable.id
            startDate = GlobalVariables.inFormatter.date(from: decodable.startDate)
            endDate = GlobalVariables.inFormatter.date(from: decodable.endDate)
            place = decodable.place
            authors = decodable.authors
            presentationDescription = decodable.description
            title = decodable.title
            conferenceId = decodable.conferenceID
            presentationTypeId = decodable.presentationTypeID
        }
    }
    
    required init() {
        super.init()
    }
}
