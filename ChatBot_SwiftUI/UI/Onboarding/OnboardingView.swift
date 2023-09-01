//
//  OnboardingView.swift
//  ChatBot_SwiftUI
//
//  Created by IKAKOOO on 10.08.23.
//

import SwiftUI

struct OnboardingView: View {
    @State private var isShowingChatView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 60)
                Text("You AI Assistant")
                    .font(.title)
                    .foregroundStyle(Color.accentColor)
                Spacer()
                    .frame(height: 14)
                Text("Using this software,you can ask you questions and receive articles using artificial intelligence assistant")
                    .font(.subheadline)
                    .foregroundStyle(Color.gray)
                    .padding(.leading, 66)
                    .padding(.trailing, 66)
                    .frame(minHeight: 100)
                Spacer()
                    .frame(minHeight: 20, maxHeight: 80)
                Image("OnboardingImage")
                Spacer()
                ZStack {
                    LargeButton(title: "Continue", backgroundColor: Color.blue) {
                        self.isShowingChatView = true
                    }
                    HStack {
                        Spacer()
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 24, height: 16)
                        Spacer()
                            .frame(width: 40)
                    }
                }
                .foregroundColor(.white)
                
                Spacer()
                    .frame(height: 30)
            }
            .navigationDestination(isPresented: $isShowingChatView) { BotChatView() }
            .navigationTitle("")
        }
        .accentColor(.gray)
    }
}

#Preview {
    OnboardingView()
}
