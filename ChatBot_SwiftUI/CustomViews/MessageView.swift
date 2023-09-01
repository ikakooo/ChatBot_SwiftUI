//
//  MessageView.swift
//  ChatBot_SwiftUI
//
//  Created by IKAKOOO on 01.09.23.
//

import SwiftUI

import SwiftUI

struct MessageView : View {
    var currentMessage: Message
    var body: some View {
        HStack(alignment: .bottom, spacing: 15) {
            if !currentMessage.user.isCurrentUser {
                Image(currentMessage.user.avatar)
                .frame(width: 40, height: 40, alignment: .center)
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.blue, lineWidth: 2)
                )
                
            } else {
                Spacer()
            }
            ContentMessageView(contentMessage: currentMessage.content,
                               isCurrentUser: currentMessage.user.isCurrentUser)
           // Spacer()
        }.padding(10)
    }
}

#Preview {
    MessageView(currentMessage: Message(content: "Hi, I Am AI Bot! Ask me anything... Hi, I Am AI Bot! Ask me anything... Hi, I Am AI Bot! Ask me anything...", user: DataSource.firstUser))
}
