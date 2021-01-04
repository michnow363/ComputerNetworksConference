//
//  PresentationParticipantDecodable.swift
//  ComputerNetworksConference
//
//  Created by Michal Nowak on 31/12/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

struct PresentationParticipantRootDecodable: Decodable {
    var id: Int
    var presentationID: String
    var participantIDs: [Int]
}

struct PresentationParticipantDecodable: Decodable {
    var id: Int
    var presentationID: String
    var participantID: Int
}
