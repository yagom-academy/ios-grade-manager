//
//  Grade.swift
//  GradeManager
//
//  Created by kakao on 2021/12/30.
//

import Foundation

enum Grade: CaseIterable {
    case aPlus, aZero
    case bPlus, bZero
    case cPlus, cZero
    case dPlus, dZero
    case fFail
    
    public var stringValue: String {
        switch self {
        case .aPlus:
            return "A+"
        case .aZero:
            return "A0"
        case .bPlus:
            return "B+"
        case .bZero:
            return "B0"
        case .cPlus:
            return "C+"
        case .cZero:
            return "C0"
        case .dPlus:
            return "D+"
        case .dZero:
            return "D0"
        case .fFail:
            return "F"
        }
    }
    
    var rateValue: Double {
        switch self {
        case .aPlus:
            return 4.5
        case .aZero:
            return 4.0
        case .bPlus:
            return 3.5
        case .bZero:
            return 3.0
        case .cPlus:
            return 2.5
        case .cZero:
            return 2.0
        case .dPlus:
            return 1.5
        case .dZero:
            return 1.0
        case .fFail:
            return 0.0
        }
    }
}

extension Grade {
    static func makeFromString(stringValue: String) throws -> Grade {
        for element in Grade.allCases where element.stringValue == stringValue {
            return element
        }
        throw InputError.wrongFormat
    }
}

