//
//  SplashView.swift
//  ChatBot_SwiftUI
//
//  Created by IKAKOOO on 10.08.23.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                OnboardingView()
            } else {
                Color.accentColor.edgesIgnoringSafeArea(.all)
                Image("BotLogoicon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 262, height: 262)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
        
}

#Preview {
    SplashView()
}
