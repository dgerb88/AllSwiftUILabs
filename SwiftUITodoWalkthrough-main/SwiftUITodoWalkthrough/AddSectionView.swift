//
//  addSection.swift
//  SwiftUITodoWalkthrough
//
//  Created by Dax Gerber on 1/23/24.
//

import SwiftUI

struct AddSectionView: View {
    @ObservedObject var todosController: TodosController
    @State var sectionTitle = ""
    @Binding var showSheet: Bool
    
    
    
    var body: some View {
        
        TextField("New section name", text: $sectionTitle)
            .textFieldStyle(.roundedBorder)
            .padding()
        Button(action: {
            addNewSection()
            showSheet = false
        }, label: {
            Text("Submit")
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                )
                .padding()
        })
    }
    
    func addNewSection() {
        let section = TodoSection(sectionTitle: sectionTitle, todos: [])
        todosController.sections.append(section)
    }
    
}

#Preview {
    AddSectionView(todosController: TodosController(), showSheet: .constant(true))
}
