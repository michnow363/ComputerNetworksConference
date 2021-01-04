//
//  PresentationDecodable.swift
//  ComputerNetworksConference
//
//  Created by Michal Nowak on 31/12/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

struct PresentationDecodable: Decodable {
    var id: Int
    var startDate: String
    var endDate: String
    var place: String
    var authors: String
    var description: String
    var title: String
    var conferenceID: Int
    var presentationTypeID: Int
}
