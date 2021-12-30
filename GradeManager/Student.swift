//
//  Student.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

struct Student: Hashable {
    let name: String
    var grade: Dictionary<String, Grade> = [:]
    var gradePointAverage: Float {
        let average = grade.compactMap { $1.gradePoint }.reduce(0, +) / Float(grade.count)
        return round(average * 100) / 100.0
    }
    
    var gradePointDescription: String {
        let gradePointDescription = grade.reduce("평점 : \(self.gradePointAverage)") {
            return """
            \($1.key): \($1.value.rawValue)
            \($0)
            """
        }
        return gradePointDescription
    }
    
    init(name: String) {
        self.name = name.uppercasingFirstAndLowercasingRest()
    }
    
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
    }
}
