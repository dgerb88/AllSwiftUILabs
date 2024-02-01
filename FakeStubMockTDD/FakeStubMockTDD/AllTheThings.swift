//
//  AllTheThings.swift
//  FakeStubMockTDD
//
//  Created by Dax Gerber on 1/31/24.
//

import Foundation

protocol Learn {
    func reading()
    func listening()
    
    func didLearn() -> Bool
}


class FakeStudent: Learn {
    
    var passFailDictionary: [String: Bool] = ["History": false]
    var isReading: Bool
    var isListening: Bool
    
    func reading() {
        isReading = true
    }
    
    func listening() {
        isListening = true
    }
    
    func didLearn() -> Bool {
        isReading && isListening
    }
    
    func passClass(className: String) {
        passFailDictionary[className] = true
    }
    
    
    init(isReading: Bool, isListening: Bool) {
        self.isReading = isReading
        self.isListening = isListening
    }
}

class StudentController {
    
    var studentNetworkService: StudentNetworkService
    var students: [String]
    
    init(studentNetworkService: StudentNetworkService) {
        self.studentNetworkService = studentNetworkService
        students = studentNetworkService.fetchDataFromDatabase()
    }
    
    func addStudent(studentName: String) {
        studentNetworkService.addToDatabase(studentName: studentName)
        students.append(studentName)
    }
    
}

protocol StudentNetworkService {
    func addToDatabase(studentName: String)
    func fetchDataFromDatabase() -> [String]
}

//class RealNetworkController: StudentNetworkService {
//
//}
