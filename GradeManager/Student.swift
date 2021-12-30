//
//  Student.swift
//  GradeManager
//
//  Created by Jinwook Huh on 2021/12/27.
//

import Foundation

struct Student {
    var name: String
    var grades: [String: Grade]
    
    init(name: String) {
        self.name = name
        self.grades = [:]
    }
    
    mutating func updateGrade(for subjuct: String, as grade: String) {
        
        switch grade {
        case "A+":
            grades[subjuct] = Grade.APlus
        case "A0":
            grades[subjuct] = Grade.AZero
        case "B+":
            grades[subjuct] = Grade.BPlus
        case "B0":
            grades[subjuct] = Grade.BZero
        case "C+":
            grades[subjuct] = Grade.CPlus
        case "C0":
            grades[subjuct] = Grade.CZero
        case "D+":
            grades[subjuct] = Grade.DPlus
        case "D0":
            grades[subjuct] = Grade.DZero
        case "F":
            grades[subjuct] = Grade.F
        default:
            print(InputError.invalidInput)
            return
        }
    }
    
    mutating func removeGrade(for subject: String) {
        grades[subject] = nil
    }
    
}
