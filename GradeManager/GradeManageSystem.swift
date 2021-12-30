//
//  GradeManager.swift
//  GradeManager
//
//  Created by Jinwook Huh on 2021/12/27.
//

import Foundation

class GradeManageSystem {
    
    let ioManager = IOManager()
 
    var isDone = false
    
    enum MenuType: String {
        case addStudent = "1"
        case removeStudent = "2"
        case addOrModifyGrade = "3"
        case removeGrade = "4"
        case lookupGrade = "5"
        case stopProgram = "X"
    }
    
    var studentDictionary: [String: Student] = [:]
    
    func receiveMenuInput() throws -> String {
        try ioManager.menuInput()
    }
    
    func performMenuAction(menuInput: String) {
        do {
            switch MenuType(rawValue: menuInput) {
            case .addStudent:
                let studentName = try ioManager.addStudentInput()
                addStudent(studentName)
            
            case .removeStudent:
                let studentName = try ioManager.removeStudentInput()
                removeStudent(studentName)
            
            case .addOrModifyGrade:
                let (studentName, subject, grade) = try ioManager.addOrModifyGradeInput()
                addOrModifyGrade(for: studentName, withSubject: subject, as: grade)
            
            case .removeGrade:
                let (studentName, subject) = try ioManager.removeGradeInput()
                removeGrade(for: studentName, withSubject: subject)
            
            case .lookupGrade:
                let studentName = try ioManager.lookupGradeInput()
                lookupGrade(for: studentName)
        
            case .stopProgram:
                stopProgram()
        
            case .none:
                ioManager.printInvalidMenuInput()
            }
        } catch {
            ioManager.printInvalidMenuInput()
        }
    }
    
    func addStudent(_ studentName: String) {
        guard studentDictionary[studentName] == nil else {
            print("\(studentName)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
            return
        }
        
        let newStudentEntity = Student(name: studentName)
        studentDictionary[studentName] = newStudentEntity
        print("\(studentName) 학생을 추가했습니다.")
    }
    
    func removeStudent(_ studentName: String) {
        guard studentDictionary[studentName] != nil else {
            print("\(studentName) 학생을 찾지 못했습니다.")
            return
        }
        
        studentDictionary.removeValue(forKey: studentName)
        print("\(studentName) 학생을 삭제하였습니다.")
    }
    
    func addOrModifyGrade(for studentName: String, withSubject subject: String, as grade: String ) {
        guard var student = studentDictionary[studentName] else {
            print("\(studentName) 학생을 찾지 못했습니다.")
            return
        }
        
        student.updateGrade(for: subject, as: grade)
        studentDictionary[studentName] = student
        
        print("\(studentName) 학생의 \(subject) 과목이 \(grade)로 추가(변경)되었습니다.")
    }
    
    func removeGrade(for studentName: String, withSubject subject: String) {
        guard var student = studentDictionary[studentName] else {
            print("\(studentName) 학생을 찾지 못했습니다.")
            return
        }
        
        student.removeGrade(for: subject)
        studentDictionary[studentName] = student
        
        print("\(studentName) 학생의 \(subject) 과목 성적이 삭제되었습니다.")
    }
    
    func lookupGrade(for studentName: String) {
        
        guard let student = studentDictionary[studentName] else {
            print("\(studentName) 학생을 찾지 못했습니다.")
            return
        }
        
        student.printAllGrades()
        do {
            let averageScore = try student.calculateAverageScore()
            print("평점 : \(averageScore)")
        } catch {
            print("\(studentName) 학생은 입력된 성적이 없습니다.")
        }

    }
    
    func stopProgram() {
        isDone = true
        ioManager.printCloseProgram()
    }
}
