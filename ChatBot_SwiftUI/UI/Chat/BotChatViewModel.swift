//
//  BotChatViewModel.swift
//  ChatBot_SwiftUI
//
//  Created by IKAKOOO on 13.08.23.
//

import Foundation
import Combine

final class BotChatViewModel: ObservableObject {
    
    var didChange = PassthroughSubject<Void, Never>()
    @Published var realTimeMessages = DataSource.messages
    
    func sendMessage(_ chatMessage: Message) {
        realTimeMessages.append(chatMessage)
        didChange.send(())
    }
    
    private var subscriptions = Set<AnyCancellable>()

    func send(draft: Message) {
      
    }
    
    func onStart() {
    }

    func onStop() {
       
    }

    func loadMoreMessage(before message: Message) {

    }
    
    

}


struct DataSource {
    static let firstUser = User(name: "ChatBot AI", avatar: "BotAvatar")
    static var secondUser = User(name: "ikakooo", avatar: "BotAvatar", isCurrentUser: true)
    static let messages = [
        Message(content: "Hi, I really love to assisting you!", user: DataSource.firstUser),
        Message(content: "Ask me anything, how can I help you?", user: DataSource.firstUser),
        Message(content: "Thanks, nice to hear that, can I have your email please?", user: DataSource.secondUser),
        Message(content: "😇", user: DataSource.firstUser),
        Message(content: "Great, wait me a sec, let me check", user: DataSource.secondUser),
        Message(content: "Sure", user: DataSource.firstUser)
    ]
}
