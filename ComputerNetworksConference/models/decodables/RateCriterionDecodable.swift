//
//  RateCriterionDecodable.swift
//  ComputerNetworksConference
//
//  Created by Michal Nowak on 01/01/2021.
//  Copyright © 2021 OtherCoders. All rights reserved.
//

struct RateCriterionDecodable: Decodable {
    var id: Int
    var name: String
    var rateCriterionTypeID: Int
    var rateCriterionTypeName: String
}
