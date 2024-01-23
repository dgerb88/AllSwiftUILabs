//
//  TodoView.swift
//  SwiftUITodoWalkthrough
//
//  Created by Brayden Lemke on 10/2/23.
//

import SwiftUI

struct TodoView: View {
    @StateObject var todosController = TodosController()
    @State var showSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    Text("Todos")
                        .font(.title)
                        .padding(.leading, 25)
                    Spacer()
                    NavigationLink {
                        CreateTodoView(todosController: todosController)
                    } label: {
                        Image(systemName: "plus")
                            .padding(.trailing, 25)
                            .font(.title.weight(.thin))
                    }

                }
                .padding()
                .frame(height: 40)
                
                List {
                    ForEach($todosController.sections) { $section in
                        Section(section.sectionTitle) {
                            ForEach($section.todos) { $todo in
                                TodoRowView(todo: $todo)
                            }
                            .onDelete(perform: { indexSet in
                                deleteTodo(at: indexSet, from: section)
                            })
                        }
                    }
                }
                .listStyle(.inset)
                Button(action: {
                    showSheet = true
                }, label: {
                    Text("New Todo Category")
                })
                .padding(.bottom)
            }
            .sheet(isPresented: $showSheet, content: {
                AddSectionView(todosController: todosController, showSheet: $showSheet)
            })
            .toolbar(.hidden)
        }
    }
    
    func deleteTodo(at offsets: IndexSet, from section: TodoSection) {
        if let index = todosController.sections.firstIndex(of: section) {
            todosController.sections[index].todos.remove(atOffsets: offsets)
        }
    }
    
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
