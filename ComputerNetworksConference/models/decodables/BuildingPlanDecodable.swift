//
//  BuildingPlanDecodable.swift
//  ComputerNetworksConference
//
//  Created by Michal Nowak on 28/12/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

struct BuildingPlanDecodable: Decodable {
    var id: Int
    var path: String
    var description: String
    var name: String
    var conferenceID: Int
}
