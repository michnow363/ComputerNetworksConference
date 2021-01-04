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
    
    private var messageEntities: Results<MessageEntity>?
    
    private let currentUser = Sender(senderId: String(GlobalVariables.currentUserId), displayName: "Me")
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateMessages()
        messageInputBar.delegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        if let layout = messagesCollectionView.collectionViewLayout as? MessagesCollectionViewFlowLayout {
            layout.textMessageSizeCalculator.outgoingAvatarSize = .zero
            layout.textMessageSizeCalculator.incomingAvatarSize = .zero
            layout.setMessageIncomingAvatarSize(.zero)
        }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateMessages), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateMessages()
    }
    
    @objc private func updateMessages() {
        RestApiManager.sharedInstance.updateLocalDatabase(with: .message, completion: {
            DispatchQueue.main.async {
                self.messageEntities = GlobalVariables.realm.objects(MessageEntity.self)
                self.messagesCollectionView.reloadData()
            }
        })
    }
    
    deinit {
        timer.invalidate()
    }
    
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messageEntities![indexPath.section].getMessage()
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messageEntities?.count ?? 0
    }
    
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        RestApiManager.sharedInstance.updateRemoteDatabase(with: ["mobileUserID": GlobalVariables.currentUserId, "content": text], url: RestApiManager.sharedInstance.postMessageURL, completion: {
            self.updateMessages()
        })
        inputBar.inputTextView.text = ""
    }
}
