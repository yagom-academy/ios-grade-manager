//
//  VerificationManager.swift
//  GradeManager
//
//  Created by 이승주 on 2021/12/30.
//

import Foundation

struct VerificationManager {
    func verifyStudentName(_ name: String) -> Bool {
        if name.isEmpty == true {
            return false
        }
        
        let pattern = "^[0-9a-zA-Z]*$"
        if name.range(of: pattern, options: .regularExpression) == nil {
            return false
        }
        return true
    }
    
    func verifyAdditinalGradeInfo(_ gradeInfo: String) -> Bool {
        if gradeInfo.isEmpty == true {
            return false
        }
        
        var gradeInfoAfterDeleteSpace = gradeInfo
            .replacingOccurrences(of: " ", with: "")
            .map{ Array(String($0)) }
        gradeInfoAfterDeleteSpace.removeLast()
        
        let gradeInfoAfterDeleteSpaceAndLastWord = gradeInfoAfterDeleteSpace
            .map{ String($0) }
            .joined()
        
        let pattern = "^[0-9a-zA-Z]*$"
        if gradeInfoAfterDeleteSpaceAndLastWord.range(of: pattern, options: .regularExpression) == nil {
            return false
        }
        
        let gradeArray = gradeInfo
            .split(separator: " ")
            .map{ String($0) }
        guard gradeArray.count == 3 else {
            return false
        }
        
        let grade = gradeArray[2]
        if Constant.grades[grade] == nil {
            return false
        }
        
        return true
    }
    
    func verifyDeletionGradeInfo(_ gradeInfo: String) -> Bool {
        if gradeInfo.isEmpty == true {
            return false
        }
        
        let gradeInfoAfterDeleteSpace = gradeInfo
            .replacingOccurrences(of: " ", with: "")
        
        let pattern = "^[0-9a-zA-Z]*$"
        if gradeInfoAfterDeleteSpace.range(of: pattern, options: .regularExpression) == nil {
            return false
        }
        
        let gradeArray = gradeInfo
            .split(separator: " ")
            .map{ String($0) }
        guard gradeArray.count == 2 else {
            return false
        }
        
        return true
    }
}
