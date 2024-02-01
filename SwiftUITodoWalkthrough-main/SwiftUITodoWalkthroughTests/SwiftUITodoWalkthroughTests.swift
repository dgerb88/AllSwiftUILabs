//
//  SwiftUITodoWalkthroughTests.swift
//  SwiftUITodoWalkthroughTests
//
//  Created by Dax Gerber on 2/1/24.
//

import XCTest
@testable import SwiftUITodoWalkthrough

final class SwiftUITodoWalkthroughTests: XCTestCase {
    
    var todoSection: TodoSection?
    let expectedTodo = Todo(id: UUID(), markedComplete: true, title: "School")
    let expectedSection = TodoSection(sectionTitle: "New Section", todos: [])
    var controller: TodosController?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.todoSection = TodoSection(id: UUID(), sectionTitle: "Bob", todos: [expectedTodo])
        self.controller = TodosController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSectionCreation() {
        XCTAssertNotNil(todoSection)
    }
    
    func testControllerCreated() {
        XCTAssertNotNil(controller)
    }
    
    func testTodoCreation() {
        XCTAssertTrue(todoSection!.todos.contains(expectedTodo))
    }
    
    func testAddTodo() {
        guard let controller, let todoSection else {
            XCTFail()
            return
        }
        
        let add = CreateTodoView(todosController: controller)
        XCTAssertNotNil(add.todosController.sections.first)
        add.addNewTodo("homeywork", for: add.todosController.sections.first!)
        
        
        if let section = add.todosController.sections.first {
            XCTAssertNotNil(section.todos.first)
            if let todo = section.todos.last {
                print(todo)
                XCTAssert(todo.title == "homeywork")
            }
        }
        
    }
    
    func testEditTodo() {
        
    }
    
    func testDeleteTodo() {
        
    }
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
