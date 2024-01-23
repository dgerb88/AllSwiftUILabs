//
//  TodosController.swift
//  SwiftUITodoWalkthrough
//
//  Created by Dax Gerber on 1/23/24.
//

import Foundation


class TodosController: ObservableObject {
    
    @Published var sections: [TodoSection]
    
    init() {
        self.sections = TodoSection.dummySections
    }
    
}
