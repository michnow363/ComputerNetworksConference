//
//  MessageViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 11/29/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift
import MessageKit
import InputBarAccessoryView

struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

class MessagePanelViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate, InputBarAccessoryViewDelegate {
    
    private var messageEntities: Results<MessageEntity>!
    
    let currentUser = Sender(senderId: "2", displayName: "Me")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageEntities = GlobalVariables.realm.objects(MessageEntity.self)
        messageInputBar.delegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
//        let notificationToken = messageEntities.observe { (changes: RealmCollectionChange) in
//            switch changes {
//            case .update(_, let deletions, let insertions, let modifications):
//                self.messagesCollectionView.reloadData()
//            default:
//                break
//            }
//        }
    }
    
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messageEntities[indexPath.section].getMessage()
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messageEntities.count
    }
    
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        let newMessageEntity = MessageEntity(for: currentUser, text: text)
        inputBar.inputTextView.text = ""
        let realm = GlobalVariables.realm
        try! realm.write {
            realm.add(newMessageEntity)
        }
        messagesCollectionView.reloadData()
    }
}
