//
//  BotChatView.swift
//  ChatBot_SwiftUI
//
//  Created by IKAKOOO on 10.08.23.
//

import SwiftUI

struct BotChatView: View {
    
    @StateObject private var viewModel: BotChatViewModel
    @State var typingMessage: String = ""
    @ObservedObject private var keyboard = KeyboardResponder()
    
    init(viewModel: BotChatViewModel = BotChatViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
        
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 2)
                .background(.blue)
            ScrollViewReader { proxy in
                List {
                    ForEach(viewModel.realTimeMessages, id: \.self) { msg in
                        MessageView(currentMessage: msg)
                            .id(msg)
                            .listRowSeparator(.hidden)
                            .listRowInsets(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
                    }
                }
                .onChange(of: viewModel.realTimeMessages) { _ in
                    proxy.scrollTo(viewModel.realTimeMessages.last)
                }
                .listStyle(.plain)
            }
            VStack {
                Spacer()
                    .frame(height: 2)
                    .background(.blue)
                HStack {

                    TextField("", text: $typingMessage)
                        .placeholder("Type a Message...", when: typingMessage.isEmpty)
                        .foregroundStyle(.blue)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .frame(minHeight: CGFloat(40))
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.blue, lineWidth: 1)
                        )
                    Button(action: sendMessage) {
                        Text("Send")
                            .foregroundStyle(.blue)
                    }
                }.frame(minHeight: CGFloat(40))
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .padding(.top, -1)
                    .padding(.bottom, 5)
            }
        }
        .padding(.bottom, keyboard.currentHeight)
        .edgesIgnoringSafeArea(keyboard.currentHeight == 0.0 ? .leading: .bottom)
        .onTapGesture { self.endEditing(true) }
        .onAppear(perform: viewModel.onStart)
        .onDisappear(perform: viewModel.onStop)
        // .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading){
                HStack {
                    Image("BotAvatar")
                    
                    VStack(alignment: .leading) {
                        Text("AI Bot")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        Text("· Online")
                            .font(.footnote)
                            .foregroundColor(.green)
                    }
                    .padding(.leading, 10)
                    
                    Spacer()
                    
                    
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing){
                
                HStack(alignment: .center) {
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "volume.2")
                            .foregroundColor(.black)
                    })
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                    })
                }
            }
        }
    }
    
    
    func sendMessage() {
        viewModel.sendMessage(Message(content: typingMessage, user: DataSource.secondUser))
        typingMessage = ""
    }
}

#Preview {
    BotChatView()
}
