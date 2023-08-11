//
//  ChatBot_SwiftUIApp.swift
//  ChatBot_SwiftUI
//
//  Created by IKAKOOO on 10.08.23.
//

import SwiftUI

@main
struct ChatBot_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView()
                .frame(minWidth: 300, idealWidth: 700, maxWidth: 1300,
                       minHeight: 700, idealHeight: 900, maxHeight: 1300,
                       alignment: .center)
                .onAppear {
                    UINavigationBar.appearance().backIndicatorImage = UIImage(systemName: "arrow.left")
                    UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")
                }
        }
    }
}
