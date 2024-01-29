//
//  TDDLabUITests.swift
//  TDDLabUITests
//
//  Created by Dax Gerber on 1/29/24.
//

import XCTest
@testable import TDDLab

final class TDDLabUITests: XCTestCase {
    
    var testPerson: Person?
    
    var expectedAge = 1
    let firstName = "Fred"
    let lastName = "Gerber"
    let expectedName = "Fred Gerber"
    let canWalk = false
    let numberOfLegs = 2

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.testPerson = Person(firstName: firstName, lastName: lastName , canWalk: canWalk, numberOfLegs: numberOfLegs, age: expectedAge)

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testName() {
        guard let testPerson else {
            XCTFail("No Person")
            return
        }
        XCTAssertEqual(testPerson.firstName, firstName)
        
        XCTAssertEqual(testPerson.lastName, lastName)
        
        XCTAssertEqual(testPerson.fullName, expectedName)
    }
    
    func testAge() {
        guard let testPerson else {
            XCTFail("No Person")
            return
        }
        XCTAssertEqual(testPerson.age, expectedAge)
    }
    
    func testBirthday() {
        guard var testPerson else {
            XCTFail("No Person")
            return
        }
        XCTAssertEqual(testPerson.age, expectedAge)

        testPerson.birthday()
        
        expectedAge += 1
        XCTAssertEqual(testPerson.age, expectedAge)
        
    }
    
    func testWalkingAbilities() {
        guard let testPerson else {
            XCTFail("No Person")
            return
        }
        
        XCTAssertFalse(testPerson.canWalk)
    }
    func testNumberOfLegs() {
        guard let testPerson else {
            XCTFail("No Person")
            return
        }
        XCTAssertEqual(testPerson.numberOfLegs, numberOfLegs)
        
    }
    
    
    
}
