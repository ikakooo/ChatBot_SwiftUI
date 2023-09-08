//
//  ContentView.swift
//  ChatBot_SwiftUI
//
//  Created by IKAKOOO on 10.08.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct LoadingWithOAnimation: View {
    
    @State var updateRotationEffect = 0
    @State var updateProgressPersent = 0
    let timerProgressPersent = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            HStack (spacing: 8) {
                Text("L")
                    .foregroundColor(.white)
                    .font(.system(size: 34))
                    .bold()
                
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 8))
                    .foregroundColor(.white.opacity(0.4))
                    .frame(width: 26, height: 26)
                    .overlay(
                        Circle()
                            .trim(from: 0, to: CGFloat(updateProgressPersent) / 100)
                            .stroke(style: StrokeStyle(lineWidth: 8))
                            .fill(.white)
                            .frame(width: 26, height: 26)
                            .rotationEffect(.init(degrees: Double(updateRotationEffect)))
                    )
                    .onReceive(timerProgressPersent) { _ in
                        if updateProgressPersent  < 100 {
                            updateProgressPersent += 1
                        }
                    }
               
                Text("ADING")
                    .foregroundColor(.white)
                    .font(.system(size: 34))
                    .bold()
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.003, repeats: true) { Timer in
                updateRotationEffect += 1
            }
        }
    }
}

#Preview {
    LoadingWithOAnimation()
}
