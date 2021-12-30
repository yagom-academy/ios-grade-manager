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
                addGradeProcess()
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
    
    private func addGradeProcess() {
        do{
            let (name, subject, grade) = try gradeConsole.getAddGradeInput()
            let result = addGrade(subject: subject, grade: grade, to: name)
            gradeConsole.showAddGradeResult(result, name: name, subject: subject, grade: grade)
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
    
    @discardableResult
    func addGrade(subject: String, grade:Grade ,to name: String) -> Bool {
        guard var student = getStudentElement(by: name) else { return false }
        student.score[subject] = grade
        students.update(with: student)
        return true
    }
    
    func getStudentElement(by name: String) -> Student? {
        guard let index = students.firstIndex(where: {$0.name == name}) else { return nil }
       return students[index]
    }
}
