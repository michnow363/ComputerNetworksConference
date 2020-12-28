//
//  UserDecodable.swift
//  ComputerNetworksConference
//
//  Created by Michal Nowak on 27/12/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

struct AccommodationDecodable: Decodable {
    var id: Int
    var address: String
    var name: String
    var number: String
    var website: String
}
