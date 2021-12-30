//
//  ProgramState.swift
//  GradeManager
//
//  Created by kakao on 2021/12/29.
//

import Foundation

enum ProgramState: String, CaseIterable {
    case run
    case stop = "X"
    
    var stateName: String {
        switch self {
        case .run: return self.rawValue
        case .stop: return "\(self.rawValue): 종료"
        }
    }
}

