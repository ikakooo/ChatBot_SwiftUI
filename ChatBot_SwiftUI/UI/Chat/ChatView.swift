//
//  ChatView.swift
//  ChatBot_SwiftUI
//
//  Created by IKAKOOO on 10.08.23.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        VStack {
            
            ZStack {
                LargeButton(title: "Continue",
                            backgroundColor: Color.blue) {
                    print("Hello World")
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

            VStack {

                Button(action: {
                    
                }, label: {
                    Image(systemName: "volume.2")
                })
                Button(action: {
                    
                }, label: {
                    Image(systemName: "square.and.arrow.up")
                })
            }
            
            Text("Hello, World!")
            Button(action: {
               
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
       // .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading){
                HStack {
                   Image("BotAvatar")
                    
                    VStack(alignment: .leading) {
                        Text("ChatGPT")
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
}

#Preview {
    ChatView()
}
