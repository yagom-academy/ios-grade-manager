//
//  util.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

let validNamePattern = "^[\\da-zA-Z]+$"
let gradeToFloat: [String: Float] = ["A+": 4.5, "A0": 4.0, "B+": 3.5, "B0": 3.0,
                                   "C+": 2.5, "C0": 2.0, "D+": 1.5, "D0": 1.0, "F": 0.0]

extension String {
    func isValidName() -> Bool {
        if let _ = self.range(of: validNamePattern, options: .regularExpression) {
            return true
        }
        else {
            return false
        }
    }
    
    func isGradeFormat() -> Bool {
        return gradeToFloat.keys.contains(self)
    }
    
    func toGradeInputForm() throws -> (String, String, String) {
        let splitInput = self.components(separatedBy: CharacterSet.whitespaces)
        guard splitInput.count == 3 else {
            throw InputError.wrongForm
        }
        let (name, subject, grade) = (splitInput[0], splitInput[1], splitInput[2])
        guard name.isValidName(), subject.isValidName() else {
            throw InputError.wrongName
        }
        guard grade.isGradeFormat() else {
            throw InputError.wrongFormat
        }
        return (name, subject, grade)
    }
}
