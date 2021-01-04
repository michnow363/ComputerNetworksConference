//
//  OrganizerDecodable.swift
//  ComputerNetworksConference
//
//  Created by Michal Nowak on 31/12/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

struct OrganizerDecodable: Decodable {
    var id: Int
    var firstName: String
    var lastName: String
    var affiliation: String
    var company: String
    var contact: String
}
