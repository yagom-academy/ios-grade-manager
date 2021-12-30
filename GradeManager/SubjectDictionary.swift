//
//  SubjectDictionary.swift
//  GradeManager
//
//  Created by kakao on 2021/12/30.
//

import Foundation

class SubjectDictionary {
    var subjectForGrade = [String: Grade]()
    
    subscript(key: String) -> Grade? {
        get {
            return subjectForGrade[key]
        }
        set(newValue) {
            subjectForGrade[key] = newValue
        }
    }
    
    func removeValue(forKey: String) -> Grade? {
        return subjectForGrade.removeValue(forKey: forKey)
    }
    
    func displayAll() {
        guard subjectForGrade.isEmpty == false else {
            print("입력된 성적 정보가 없습니다.")
            return
        }
        let rateSum = subjectForGrade.reduce(0.0) { partialResult, tuple in
            let (subject, grade) = tuple
            print("\(subject): \(grade.stringValue)")
            return partialResult + grade.rateValue
        }
        let averageRate = rateSum / Double(subjectForGrade.count)
        print(String(format: "%.2f", averageRate))
    }
}
