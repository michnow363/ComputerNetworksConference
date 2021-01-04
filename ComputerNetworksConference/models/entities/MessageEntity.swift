//
//  MessageEntity.swift
//  ComputerNetworksConference
//
//  Created by Michal on 12/2/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class MessageEntity: RealmEntity {
    
    static func getNewId() -> Int {
        return (GlobalVariables.realm.objects(MessageEntity.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
    func getMessage() -> Message {
        return Message(sender: Sender(senderId: String(senderId), displayName: "Anonymus"), messageId: String(id), sentDate: sentDate, kind: .text(text))
    }
    
    @objc dynamic var sentDate : Date = Date()
    @objc dynamic var text: String = ""
    //ids
    @objc dynamic var senderId : Int = 0
    
    required init(from decodable: Decodable) {
        super.init(from: decodable)
        if let decodable = decodable as? MessageDecodable {
            id = decodable.id
            sentDate = GlobalVariables.inFormatter.date(from: decodable.sentDate)!
            text = decodable.content
            senderId = decodable.mobileUserID
        }
    }
    
    required init() {
        super.init()
    }
}


