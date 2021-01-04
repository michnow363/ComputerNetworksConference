//
//  Buildings_plans.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class BuildingPlanEntity: RealmEntity {
    @objc dynamic var path : String?
    @objc dynamic var buildingPlanDescription : String?
    @objc dynamic var name : String?
    //ids
    @objc dynamic var conferenceId : Int = 0
    
    required init(from decodable: Decodable) {
        super.init(from: decodable)
        if let decodable = decodable as? BuildingPlanDecodable {
            id = decodable.id
            path = decodable.path
            buildingPlanDescription = decodable.description
            name = decodable.name
            conferenceId = decodable.conferenceID
        }
    }
    
    required init() {
        super.init()
    }
}
