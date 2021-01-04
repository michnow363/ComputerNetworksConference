//
//  GlobalVariables.swift
//  ComputerNetworksConference
//
//  Created by Michal on 6/25/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

struct GlobalVariables {
    static var currentUserId: Int = {
        return 1
    }()
    
    static var currentConferenceID: Int = {
        let conference = realm.objects(ConferenceEntity.self).filter("title == 'Computer Networks Conference'").first
        return conference?.id ?? 2
    }()

    static let realm: Realm = {
        let conf = Realm.Configuration(schemaVersion: 1)
        return try! Realm(configuration: conf)
    }()
    
    static let inFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
        return dateFormatter
    }()
}
