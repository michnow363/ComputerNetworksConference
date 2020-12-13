//
//  MessageEntity.swift
//  ComputerNetworksConference
//
//  Created by Michal on 12/2/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class MessageEntity: Object {
    
    static func getNewId() -> Int{
        return (GlobalVariables.realm.objects(MessageEntity.self).max(ofProperty: "ID") as Int? ?? 0) + 1
    }
    
    init (for sender: Sender, text: String) {
        ID = MessageEntity.getNewId()
        sentDate = Date()
        senderId = Int(sender.senderId)!
        self.text = text
    }
    
    init (from message: Message) {
        ID = Int(message.messageId)!
        sentDate = message.sentDate
        senderId = Int(message.sender.senderId)!
    }
    
    func getMessage() -> Message{
        return Message(sender: Sender(senderId: String(senderId), displayName: "Anonymus"), messageId: String(ID), sentDate: sentDate, kind: .text(text))
    }
    
    override required init() {
    }
    
    @objc dynamic var ID : Int = 0
    @objc dynamic var sentDate : Date!
    @objc dynamic var text: String = ""
    //ids
    @objc dynamic var senderId : Int = 0
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}


