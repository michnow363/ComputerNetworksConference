//
//  RateDecodable.swift
//  ComputerNetworksConference
//
//  Created by Michal Nowak on 01/01/2021.
//  Copyright © 2021 OtherCoders. All rights reserved.
//

struct RateDecodable: Decodable {
    var id: Int
    var description: String
    var value: Int
    var mobileUserID: Int
    var rateCriterionID: Int
    var rateCriterionName: String
    var conferenceID: Int
    var conferenceName: String
    var presentationID: Int
    var presentationName: String
}
