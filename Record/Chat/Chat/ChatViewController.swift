//
//  ChatViewController.swift
//  Record
//
//  Created by Алешка on 9.06.22.
//

import UIKit
import MessageKit
import InputBarAccessoryView

struct Sender:SenderType {
    var senderId: String
    var displayName: String
    }

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
    }

class ChatViewController: MessageViewController {
    
    var chatID: String?
    var otherId: String?
    let service = Service.shared
    let selfSender = Sender(senderId: "1", displayName: "Me")
    let otherSender = Sender(senderId: "2", displayName: "Bob")
    
    var messages = [Message]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messages.append(Message(sender: selfSender, messageId: "1", sentDate: Date().addingTimeInterval(-99), kind: .text("Hello Bob")))
        
        messages.append(Message(sender: otherSender, messageId: "2", sentDate: Date().addingTimeInterval(-100), kind: .text("Hello Me")))
        messages.append(Message(sender: otherSender, messageId: "3", sentDate: Date().addingTimeInterval(-101), kind: .text("Mobile Legens")))
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        showMessageTimestampOnSwipeLeft = true
        
    }
    }
extension ChatViewController:
    MessagesDisplayDelegate,MessagesLayoutDelegate, MessagesDataSource {
    func currentSender() -> SenderType {
        return selfSender
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    
}
extension ChatViewController:InputBarAccessoryViewDelegate {
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        
        let msg = Message(sender: selfSender, messageId: "12312", sentDate: Date(), kind: .text(text))
        messages.append(Message(sender: selfSender, messageId: "1314", sentDate: Date(), kind: .text(text)))
        
        messages.append(msg)
        service.sendMessage(otherId: self.otherId, convoId: self.chatID, message: msg, text: text) { [weak self] isSend in
            DispatchQueue.main.async {
            inputBar.inputTextView.text = nil
                self?.messagesCollectionView.reloadDataAndKeepOffset()
            
            }
        
    }
}
}
