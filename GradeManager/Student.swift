//
//  Student.swift
//  GradeManager
//
//  Created by kakao on 2021/12/29.
//

import Foundation

struct Student: Hashable {
    let name: String
    var score: [String: Grade] = [:]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func ==(lhs: Student, rhs: Student) -> Bool {
        return lhs.name == rhs.name
    }
}

enum Grade: String {
    case Aplus = "A+"
    case Azero = "A0"
    case Bplus = "B+"
    case Bzero = "B0"
    case Cplus = "C+"
    case Czero = "C0"
    case Dplus = "D+"
    case Dzero = "D0"
    case F
    
    var asScore: Double {
        switch self {
        case .Aplus:
            return 4.5
        case .Azero:
            return 4.0
        case .Bplus:
            return 3.5
        case .Bzero:
            return 3.0
        case .Cplus:
            return 2.5
        case .Czero:
            return 2.0
        case .Dplus:
            return 1.5
        case .Dzero:
            return 1.0
        case .F:
            return 0
        }
    }
}
