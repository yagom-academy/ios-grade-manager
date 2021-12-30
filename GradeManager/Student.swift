//
//  Student.swift
//  GradeManager
//
//  Created by Jinwook Huh on 2021/12/27.
//

import Foundation

struct Student {
    var name: String
    var grades: [String: String]
    
    init(name: String) {
        self.name = name
        self.grades = [:]
    }
    
    mutating func updateGrade(for subjuct: String, as grade: String) {
        grades[subjuct] = grade
    }
    
    mutating func removeGrade(for subject: String) {
        grades[subject] = nil
    }
    
}
