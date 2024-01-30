//
//  skeleton.swift
//  SOLID Lab
//
//  Created by Dax Gerber on 1/30/24.
//

import Foundation


//S
class Sport {
    var usesBall: Bool
    var description: String
    
    func howGameStarts() {
        print("Whistle")
    }
    
    init(usesBall: Bool, description: String) {
        self.usesBall = usesBall
        self.description = description
    }
}

class SportService {
    func saveSportToDatabase(_ sport: Sport) {
        //Save to the database
    }
    
    func categorizeByBallOrNoBall(_ sport: Sport) -> Bool {
        sport.usesBall
    }
}

protocol RunningInvolved {
    func doesRun() -> Bool
}

class trackAndField: Sport, RunningInvolved {
    func doesRun() -> Bool {
        true
    }
    override func howGameStarts() {
        print("Gunshot noise")
    }
}
class Bowling: Sport, RunningInvolved {
    func doesRun() -> Bool {
        false
    }
    override func howGameStarts() {
        print("Start bowling!")
    }
}
class Football: Sport, RunningInvolved, Tackle {
    func doesRun() -> Bool {
        true
    }
    func tacklePerson() {
        print("Nice tackle bro")
    }
}

//O
class SportsThatRun {
    //D
    var allSports: [RunningInvolved]
    var runningSports: [RunningInvolved] {
        var onlyTheRunSports = [RunningInvolved]()
        for sport in allSports {
            if sport.doesRun() {
                onlyTheRunSports.append(sport)
            }
        }
        return onlyTheRunSports
    }
    init(allSports: [RunningInvolved]) {
        self.allSports = allSports
    }
    //L
    func startGame(sport: Sport) {
        sport.howGameStarts()
    }
}
//I
protocol Tackle {
    func tacklePerson()
}


