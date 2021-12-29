//
//  Student.swift
//  GradeManager
//
//  Created by 이승주 on 2021/12/29.
//

struct Student: Hashable {
    let name: String
    var gradeForSubject: [String: String]
    
    init(name: String) {
        self.name = name
        gradeForSubject = [:]
    }
    
    init(name: String, gradeForSubject: [String: String]) {
        self.name = name
        self.gradeForSubject = gradeForSubject
    }
}
