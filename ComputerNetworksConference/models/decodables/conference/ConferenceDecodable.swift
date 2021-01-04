//
//  ConferenceDecodable.swift
//  ComputerNetworksConference
//
//  Created by Michal Nowak on 28/12/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

struct ConferenceDecodable: Decodable {
    var id: Int
    var address: String
    var country: String
    var description: String
    var startDate: String
    var endDate: String
    var title: String
    var socialMedia: String
    var photo: String
}
