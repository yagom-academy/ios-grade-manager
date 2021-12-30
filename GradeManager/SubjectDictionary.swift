//
//  SubjectDictionary.swift
//  GradeManager
//
//  Created by kakao on 2021/12/30.
//

import Foundation

class SubjectDictionary {
    var subjectForGrade = [String: String]()
    
    subscript(key: String) -> String? {
        get {
            return subjectForGrade[key]
        }
        set(newValue) {
            subjectForGrade[key] = newValue
        }
    }
    
    func removeValue(forKey: String) -> String? {
        return subjectForGrade.removeValue(forKey: forKey)
    }
}
