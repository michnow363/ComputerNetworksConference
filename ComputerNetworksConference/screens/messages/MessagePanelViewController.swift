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
    
    static func getViewController() -> MessagePanelViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "MessagePanelViewController") as! MessagePanelViewController
        return vc
    }
    
    private var messageEntities: Results<MessageEntity>!
    
    private let currentUser = Sender(senderId: "2", displayName: "Me")
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateMessages()
        messageInputBar.delegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateMessages), userInfo: nil, repeats: true)
    }
    
    @objc private func updateMessages() {
        messageEntities = GlobalVariables.realm.objects(MessageEntity.self)
        messagesCollectionView.reloadData()
    }
    
    deinit {
        timer.invalidate()
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
