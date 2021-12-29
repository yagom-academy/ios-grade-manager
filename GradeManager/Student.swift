//
//  Student.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

struct Student: Hashable {
    let name: String
    var grades: Dictionary<String,String>
    
    init(name: String) {
        self.name = name
        self.grades = [:]
    }
    
    init(name: String, grades: Dictionary<String,String>) {
        self.name = name
        self.grades = grades
    }
}

