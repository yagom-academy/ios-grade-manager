//
//  Grade.swift
//  GradeManager
//
//  Created by kakao on 2021/12/30.
//

import Foundation

enum Grade: String, CaseIterable {
    
    case aPlus = "A+"
    case aZero = "A0"
    case bPlus = "B+"
    case bZero = "B0"
    case cPlus = "C+"
    case cZero = "C0"
    case DPlus = "D+"
    case Dzero = "D0"
    case F
    
    var gradePoint: Float {
        switch self {
        case .aPlus: return 4.5
        case .aZero: return 4.0
        case .bPlus: return 3.5
        case .bZero: return 3.0
        case .cPlus: return 2.5
        case .cZero: return 2.0
        case .DPlus: return 1.5
        case .Dzero: return 1.0
        case .F: return 0.0
        }
    }
    
}
