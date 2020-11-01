//
//  GlobalVariables.swift
//  ComputerNetworksConference
//
//  Created by Michal on 6/25/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

struct GlobalVariables {
    static var currentConferenceID: Int = {
        let conference = realm.objects(ConferenceEntity.self).filter("title == 'Computer Networks Conference'").first
        return conference?.ID ?? 0
    }()

    static let realm: Realm = {
        let conf = Realm.Configuration(schemaVersion: 1)
        return try! Realm(configuration: conf)
    }()
    
}
//let conf = Realm.Configuration(schemaVersion: 1)
//let realm = try! Realm(configuration: conf)
//print(Realm.Configuration.defaultConfiguration.fileURL)
/*try! realm.write {
    let pres = PresentationsEntity()
    pres.authors = "Mr Smith"
    pres.date = Date()
    pres.presentationDescription = ""
    pres.endTime = "21:00"
    pres.place = "Gliwice"
    pres.startTime = "19:30"
    pres.title = "Deep lerning in Python"
    
    realm.add(pres)
}*/
