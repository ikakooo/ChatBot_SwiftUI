//
//  ContentMessageView.swift
//  ChatBot_SwiftUI
//
//  Created by IKAKOOO on 01.09.23.
//

import SwiftUI

struct ContentMessageView: View {
    var contentMessage: String
    var isCurrentUser: Bool
    
    var body: some View {
        Text(contentMessage)
            .padding(10)
            .foregroundColor(isCurrentUser ? Color.white : Color.black)
            .background(isCurrentUser ? Color.blue : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
            .cornerRadius(10)
    }
}

#Preview {
    ContentMessageView(contentMessage: "Hi, I am your friend", isCurrentUser: false)
}
