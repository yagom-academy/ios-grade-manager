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
    
    func step() {
        gradeConsole.showMenu()
        
        do{
            let menu = try gradeConsole.getMenuInput()
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
        } catch {
            gradeConsole.printInputError(error)
        }
    }
    
    private func addStudentProcess() {
        do{
            let name = try gradeConsole.getNameInput()
            let result = addStudent(by: name)
            gradeConsole.showAddStudentResult(result, name: name)
        } catch {
            gradeConsole.printInputError(error)
        }
    }
    
    private func deleteStudentProcess() {
        do{
            let name = try gradeConsole.getNameInput()
            let result = deleteStudent(by: name)
            gradeConsole.showDeleteStudentResult(result, name: name)
        } catch {
            gradeConsole.printInputError(error)
        }
    }
    
    @discardableResult
    func addStudent(by name: String) -> Bool {
        let (success,_) = students.insert(Student(name: name))
        return success
    }
    
    @discardableResult
    func deleteStudent(by name: String) -> Bool {
        students.remove(Student(name: name)) != nil
    }
}
