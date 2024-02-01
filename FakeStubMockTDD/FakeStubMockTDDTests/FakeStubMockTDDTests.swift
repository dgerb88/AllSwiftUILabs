//
//  FakeStubMockTDDTests.swift
//  FakeStubMockTDDTests
//
//  Created by Dax Gerber on 1/31/24.
//

import XCTest
@testable import FakeStubMockTDD

class FakeDatabase: StudentNetworkService {
    func addToDatabase(studentName: String) {
        students.append(studentName)
    }
    
    func fetchDataFromDatabase() -> [String] {
        students
    }
    
    var students = ["Tyler"]
}

final class FakeStubMockTDDTests: XCTestCase {
    
    let database = FakeDatabase()
    var studentController: StudentController?
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.studentController = StudentController(studentNetworkService: database)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAdd() {
        XCTAssertTrue(database.students.contains("Tyler"))
        XCTAssertFalse(database.students.contains("Dax"))
        studentController?.addStudent(studentName: "Dax")
        XCTAssertTrue(database.students.contains("Dax"))
    }
    
    func testFetch() {
        XCTAssertNotNil(studentController?.students)
    }
    
    
    
    
    
}
