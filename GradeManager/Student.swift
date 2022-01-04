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
        
        do {
            grades[subjuct] = try Grade.gradeForString(for: grade)
        } catch {
            print(InputError.invalidInput)
        }
    }
    
    mutating func removeGrade(for subject: String) {
        grades[subject] = nil
    }
    
    func printAllGrades() {
        for grade in grades {
            print(grade.key, terminator: ": ")
            Grade.printGradeString(for: grade.value)
        }
    }
    
    func calculateAverageScore() throws -> Double {
        guard grades.count != 0 else {
            throw InputError.emptyGrades
        }
        
        let averageGrade = grades.values
            .map{ $0.rawValue }
            .reduce(0.0, +) / Double(grades.count)
        
        return averageGrade
    }
}
