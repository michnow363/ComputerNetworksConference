//
//  PresentationTypeDecodable.swift
//  ComputerNetworksConference
//
//  Created by Michal Nowak on 31/12/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

struct PresentationTypeDecodable: Decodable {
    var id: Int
    var name: String
    var description: String?
}