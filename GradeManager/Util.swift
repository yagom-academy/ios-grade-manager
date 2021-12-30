//
//  util.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

let validNamePattern = "^[\\da-zA-Z]+$"


extension String {
    func isValidName() -> Bool {
        if let _ = self.range(of: validNamePattern, options: .regularExpression) {
            return true
        }
        return false
    }
    
    func toAddGradeForm() throws -> (String, String, Grade) {
        let splitInput = self.components(separatedBy: CharacterSet.whitespaces)
        guard splitInput.count == 3 else {
            throw InputError.wrongForm
        }
        let (name, subject, gradeString) = (splitInput[0], splitInput[1], splitInput[2])
        guard name.isValidName(), subject.isValidName() else {
            throw InputError.wrongName
        }
        let grade = try Grade.makeFromString(stringValue: gradeString)
        return (name, subject, grade)
    }
    
    func toDeleteGradeForm() throws -> (String, String) {
        let splitInput = self.components(separatedBy: CharacterSet.whitespaces)
        guard splitInput.count == 2 else {
            throw InputError.wrongForm
        }
        let (name, subject) = (splitInput[0], splitInput[1])
        guard name.isValidName(), subject.isValidName() else {
            throw InputError.wrongName
        }
        return (name, subject)
    }
}
