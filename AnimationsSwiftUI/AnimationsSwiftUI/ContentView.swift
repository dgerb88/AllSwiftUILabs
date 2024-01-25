//
//  ContentView.swift
//  AnimationsSwiftUI
//
//  Created by Dax Gerber on 1/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var go = false
    @State var goTime = false
    @State var startAnimation = false
    @State var textToShow = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.black)
                .ignoresSafeArea()
            VStack {
                Spacer()
                if goTime == false {
                    Text(textToShow)
                        .font(.system(size: startAnimation ? 40 : 90))
                        .opacity(startAnimation ? 0.0 : 1)
                        .foregroundStyle(.white)
                } else {
                    Text("GO!")
                        .font(.system(size: go ? 40 : 90))
                        .foregroundStyle(.white)
                }
                Spacer()
                Button(action: {
                    textToShow = "3"
                    withAnimation(.easeIn(duration: 1)) {
                        startAnimation.toggle()
                    } completion: {
                        textToShow = "2"
                        startAnimation.toggle()
                        withAnimation(.easeIn(duration: 1)) {
                            startAnimation.toggle()
                        } completion: {
                            textToShow = "1"
                            startAnimation.toggle()
                            withAnimation(.easeIn(duration: 1)) {
                                startAnimation.toggle()
                            } completion: {
                                textToShow = "GO!"
                                goTime = true
                                withAnimation(.easeIn(duration: 1)) {
                                    go.toggle()
                                }
                            }
                        }
                        
                    }
                    
                }, label: {
                    Text("Start Game")
                })
                .padding()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
