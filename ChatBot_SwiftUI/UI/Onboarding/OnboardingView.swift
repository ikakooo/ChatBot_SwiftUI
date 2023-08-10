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
                Spacer()
                    .frame(height: 80)
                Image("OnboardingImage")
                Spacer()
                Button(action: {
                    self.isShowingChatView = true
                }, label: {
                    
                    ZStack {
                        HStack {
                            Spacer()
                            Text("Continue")
                                .font(.title2)
                                .fontWeight(.medium)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Image(systemName: "arrow.right")
                                .resizable()
                                .frame(width: 24, height: 16)
                        }
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        ZStack {
                            RoundedRectangle(
                                cornerRadius: 20,
                                style: .continuous
                            )
                            .fill(.blue)
                        })
                })
                .padding(.leading, 21)
                .padding(.trailing, 21)
            }
            .navigationDestination(isPresented: $isShowingChatView) { ChatView() }
        }
        
    }
    
}

#Preview {
    OnboardingView()
}
