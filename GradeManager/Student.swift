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
    
    func printAllGrades() {
        for grade in grades {
            print(grade.key, terminator: ": ")
            switch grade.value {
            case .APlus:
                print("A+")
            case .AZero:
                print("A0")
            case .BPlus:
                print("B+")
            case .BZero:
                print("B0")
            case .CPlus:
                print("C+")
            case .CZero:
                print("C0")
            case .DPlus:
                print("D+")
            case .DZero:
                print("D0")
            case .F:
                print("F")
            }
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
