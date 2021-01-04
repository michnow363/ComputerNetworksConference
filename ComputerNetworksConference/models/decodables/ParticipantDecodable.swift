//
//  ParticipantDecodable.swift
//  ComputerNetworksConference
//
//  Created by Michal Nowak on 31/12/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

struct ParticipantDecodable: Decodable {
    var id: Int
    var company: String
    var affiliation: String
    var country: String
    var description: String
    var firstName: String
    var lastName: String
    var photo: String
}
