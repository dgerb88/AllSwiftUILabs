//
//  Person.swift
//  TDDLab
//
//  Created by Dax Gerber on 1/29/24.
//

import Foundation


struct Person {
    var firstName: String
    var lastName: String
    var canWalk: Bool
    var numberOfLegs: Int
    var age: Int
    
    var fullName: String {
        return firstName + " " + lastName
    }
    
    init(firstName: String, lastName: String, canWalk: Bool, numberOfLegs: Int, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.canWalk = canWalk
        self.numberOfLegs = numberOfLegs
        self.age = age
    }
    
    mutating func birthday() {
        self.age += 1
    }
    
    
}
