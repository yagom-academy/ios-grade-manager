//
//  String+.swift
//  GradeManager
//
//  Created by kakao on 2021/12/30.
//

import Foundation

extension String {
    
    func convertToFloatScore() -> Float? {
        switch self {
        case "A+", "a+":
            return 4.5
        case "A", "a":
            return 4.0
        case "B+", "b+":
            return 3.5
        case "B", "b":
            return 3.0
        case "C+", "c+":
            return 2.5
        case "C", "c":
            return 2.0
        case "D+", "d+":
            return 1.5
        case "D", "d":
            return 1.0
        case "F", "f":
            return 0
        default:
            return nil
        }
    }
}
