//
//  GradeManager.swift
//  GradeManager
//
//  Created by kakao on 2021/12/29.
//

import Foundation

class GradeManager {
    var students = Set<Student>()
    
    func addStudent(by name: String) -> Bool{
        let (success,_) = students.insert(Student(name: name))
        return success
    }
    
    func deleteStudent(by name: String) -> Bool{
        students.remove(Student(name: name)) != nil
    }
}
