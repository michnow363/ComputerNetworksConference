//
//  DecodableEntity.swift
//  ComputerNetworksConference
//
//  Created by Michal Nowak on 27/12/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class RealmEntity: Object
{
    @objc dynamic var id : Int = 0
    
    required init(from decodable: Decodable) { }
    
    required override init() {}
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
