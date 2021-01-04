//
//  SponsorDecodable.swift
//  ComputerNetworksConference
//
//  Created by Michal Nowak on 01/01/2021.
//  Copyright © 2021 OtherCoders. All rights reserved.
//

struct SponsorDecodable: Decodable {
    var id: Int
    var country: String
    var description: String
    var logoPath: String
    var name: String
    var website: String
}
