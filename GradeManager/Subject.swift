//
//  Subject.swift
//  GradeManager
//
//  Created by kakao on 2022/01/03.
//

import Foundation

struct Subject: Hashable {
    let name: String
    let grade: Grade
    
    init(name: String, grade: Grade) {
        self.name = name
        self.grade = grade
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    func display() {
        print("\(name): \(grade.stringValue)")
    }
}
