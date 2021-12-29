//
//  GradeManager.swift
//  GradeManager
//
//  Created by kakao on 2021/12/29.
//

import Foundation

class GradeManager {
    private var students = Set<Student>()
    var running = true
    let gradeConsole = GradeConsole()
    
    func step(){
        gradeConsole.showMenu()
        
        guard let menu = gradeConsole.getMenuInput() else { return }

        gradeConsole.showSelected(menu)
        
        switch menu {
        case .addStudent:
            addStudentProcess()
        case .deleteStudent:
            deleteStudentProcess()
        case .addGrade:
            break
        case .deleteGrade:
            break
        case .averageGrade:
            break
        case .exit:
            running = false
        }
    }
    
    private func addStudentProcess(){
        guard let name = gradeConsole.getInput() else { return }
        gradeConsole.showAddStudentResult(addStudent(by: name), name: name)
    }
    
    private func deleteStudentProcess(){
        guard let name = gradeConsole.getInput() else { return }
        gradeConsole.showDeleteStudentResult(deleteStudent(by: name), name: name)
    }
    
    private func addStudent(by name: String) -> Bool{
        let (success,_) = students.insert(Student(name: name))
        return success
    }
    
    private func deleteStudent(by name: String) -> Bool{
        students.remove(Student(name: name)) != nil
    }
}
