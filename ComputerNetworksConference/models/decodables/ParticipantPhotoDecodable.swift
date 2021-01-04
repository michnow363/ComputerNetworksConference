//
//  ParticipantPhotoDecodable.swift
//  ComputerNetworksConference
//
//  Created by Michal Nowak on 31/12/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

struct ParticipantPhotoDecodable: Decodable {
    var id: Int
    var path: String
    var participantID: Int
}
