//
//  CreateTodoView.swift
//  SwiftUITodoWalkthrough
//
//  Created by Dax Gerber on 1/23/24.
//

import SwiftUI

struct CreateTodoView: View {
    
    @ObservedObject var todosController: TodosController
    @State var newToDoText = ""
    @State var selectedSection: TodoSection
    @Environment(\.dismiss) var dismiss
    
    init(todosController: TodosController) {
        _todosController = ObservedObject(wrappedValue: todosController)
        _selectedSection = State(initialValue: todosController.sections[0])
    }
    
    var body: some View {
        VStack {
            Text("Create new Todo")
                .font(.largeTitle)
                .fontWeight(.thin)
                .padding(.top)
            Spacer()
            HStack {
                TextField("Todo", text: $newToDoText)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.gray, style: StrokeStyle(lineWidth: 0.2))
                    )
                    .padding()
                Picker("For Section", selection: $selectedSection) {
                    ForEach(todosController.sections, id: \.self) { section in
                        Text(section.sectionTitle)
                    }
                }
            }
            .padding()
            Spacer()
            VStack {
                Button(action: {
                    if !newToDoText.isEmpty {
                        addNewTodo(newToDoText, for: selectedSection)
                        dismiss()
                    }
                }, label: {
                    Text("Create")
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .background(
                            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                        )
                })
                
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Cancel")
                        .foregroundStyle(.red)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .background(
                            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                                .stroke(.red)
                        )
                })
            }.padding()
        }
    }
    
    func addNewTodo(_ todoTitle: String, for section: TodoSection) {
        if let sectionIndex = todosController.sections.firstIndex(where: { $0 == section }) {
            todosController.sections[sectionIndex].todos.append(Todo(markedComplete: false, title: todoTitle))
        }
    }
    
}

#Preview {
    CreateTodoView(todosController: TodosController())
}
#Preview {
    CreateTodoView(todosController: TodosController())
        .preferredColorScheme(.dark)
}
