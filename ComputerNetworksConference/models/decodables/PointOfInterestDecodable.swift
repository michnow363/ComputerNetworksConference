//
//  PointOfInterestDecodable.swift
//  ComputerNetworksConference
//
//  Created by Michal Nowak on 31/12/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

struct PointOfInterestDecodable: Decodable {
    var id: Int
    var name: String
    var address: String
    var contact: String
    var description: String
    var pointOfInterestTypeID: Int
    var pointOfInterestTypeName: String
}
