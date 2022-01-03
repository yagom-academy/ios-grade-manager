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
                deleteGradeProcess()
            case .averageGrade:
                averageGradeProcess()
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
    
    private func deleteGradeProcess() {
        do {
            let (name, subject) = try gradeConsole.getDeleteGradeInput()
            let result = try deleteGrade(subject: subject, of: name)
            gradeConsole.showDeleteGradeResult(result, name: name, subject: subject)
        } catch {
            gradeConsole.printInputError(error)
        }
    }
    
    private func averageGradeProcess() {
        do{
            let name = try gradeConsole.getNameInput()
            guard let student = getStudent(by: name) else {
                throw InputError.invalidName(name)
            }
            student.subjects.forEach { subject, grade in
                self.gradeConsole.showGrade(grade,subject: subject)
            }
            guard let averageGrade = student.averageGrade() else {
                throw InputError.invalidInput
            }
            gradeConsole.showAverageGrade(averageGrade)
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
        guard var student = getStudent(by: name) else { return false }
        student.subjects[subject] = grade
        students.update(with: student)
        return true
    }
    
    func deleteGrade(subject: String, of name: String) throws -> Bool {
        guard var student = getStudent(by: name) else {
            throw InputError.invalidName(name)
        }
        guard student.subjects[subject] != nil else {
            throw InputError.invalidSubject(name, subject)
        }
        student.subjects[subject] = nil
        students.update(with: student)
        return true
    }
    
    private func getStudent(by name: String) -> Student? {
        students.first(where: {$0.name == name})
    }
}
