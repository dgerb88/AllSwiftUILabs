//
//  ContentView.swift
//  swiftuiPractice
//
//  Created by Dax Gerber on 1/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Fun Fact")
                .foregroundStyle(.white)
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(
                    UnevenRoundedRectangle(cornerRadii: .init(
                        topLeading: 10,
                        topTrailing: 10))
                    .foregroundStyle(.blue)
                )
            ZStack {
                rectView()
                funFactView()
            }
        }
        
        .padding()
    }
}

#Preview {
    ContentView()
}


func funFactView() -> some View {
    HStack(spacing: 30) {
        Text("3x")
            .font(.system(size: 50))
            .fontWeight(.semibold)
        VStack(alignment: .leading) {
            Text("All trails members are 3 times")
            Text("more likely to hit the trail")
        }
    }
}

func rectView() -> some View {
    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0, bottomLeading: 20, bottomTrailing: 20, topTrailing: 20))
        .foregroundColor(.gray)
        .opacity(0.1)
        .frame(width: UIScreen.main.bounds.width - 30, height: 100)
}
