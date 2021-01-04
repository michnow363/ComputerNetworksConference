//
//  MessageDecodable.swift
//  ComputerNetworksConference
//
//  Created by Michal Nowak on 29/12/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

struct MessageDecodable: Decodable {
    var id: Int
    var sentDate: String
    var mobileUserID: Int
    var content: String
}
