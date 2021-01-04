//
//  ConferenceSponsorDecodable.swift
//  ComputerNetworksConference
//
//  Created by Michal Nowak on 03/01/2021.
//  Copyright © 2021 OtherCoders. All rights reserved.
//

struct ConferenceSponsorDecodable: Decodable {
    var id: Int
    var conferenceID: Int
    var sponsorID: Int
}
