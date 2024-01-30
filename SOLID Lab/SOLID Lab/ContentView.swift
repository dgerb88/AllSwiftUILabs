//
//  ContentView.swift
//  SOLID Lab
//
//  Created by Dax Gerber on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    
    let bowling = Bowling(usesBall: true, description: "Roll some balls, hit some pins")
    let football = Football(usesBall: true, description: "Run around, tackle some guys")
    
    var body: some View {
        VStack {
            Button(action: {
                SportsThatRun(allSports: [football, bowling]).startGame(sport: bowling)
            }, label: {
                Text("Button")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
