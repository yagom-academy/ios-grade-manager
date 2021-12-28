//
//  GradeManager.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

struct GradeManager{
    
    var students : Set<Student> = Set()
    
    func validateMenuNumber(of input: String?) -> MenuInputValidationResult{
                
        guard let input = input, !input.isEmpty else {
            return .invalidMenuNumber
        }
        
        if input.lowercased() == "x" {
            return .exit
        }
        
        guard let menuNum = Int(input), 1...5 ~= menuNum else {
            return .invalidMenuNumber
        }
        
        return .validMenuNumber(of: menuNum)
        
    }
    
    func validateStudentName(of name: String?) -> Bool{
        
        let pattern = "^[A-Za-z0-9]*$"
        
        guard let name = name, !name.isEmpty, let _ = name.range(of: pattern, options: .regularExpression)  else {
            return false
        }
        
        return true
    }
    
    mutating func addStudent(_ name: String?) -> StudentAdditionResult{
        
        guard let name = name, validateStudentName(of: name) else{
            return .invalidName
        }
        
        let newStudent = Student(name: name.prefix(1).uppercased() + name.lowercased().dropFirst())
        
        if students.contains(newStudent){
            return .redundantName(of: newStudent.name)
        }
        
        students.insert(newStudent)
        return .success(of: newStudent.name)
    }
    
    mutating func deleteStudent(_ name: String?) -> StudentDeletionResult{
        
        guard let name = name, validateStudentName(of: name) else{
            return .invalidName
        }
        
        guard let removedStudent = students.remove(Student(name: name.prefix(1).uppercased() + name.lowercased().dropFirst())) else {
            return .notExistence(of: name)
        }
        
        return .success(of: removedStudent.name)
    }
}

extension GradeManager{
    
    mutating func start(){
        
    loop: while true {
            print("원하는 기능을 입력해주세요")
            print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
            let menu = readLine()
        
            switch validateMenuNumber(of: menu){
            case .validMenuNumber(let menuNum): startMenu(of: menuNum)
            case .invalidMenuNumber: print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
            case .exit:
                print("프로그램을 종료합니다...")
                break loop
            }
        }
    }
    
    mutating func startMenu(of menu: Int){
        switch menu{
        case 1: startStudentAddition()
        case 2: startStudentDeletion()
        default: break
        }
    }
    
    mutating func startStudentAddition(){

        print("추가할 학생의 이름을 입력해주세요")
        let newName = readLine()
        
        switch self.addStudent(newName){
        case .success(let name): print("\(name) 학생을 추가했습니다.")
        case .redundantName(let name): print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        case .invalidName: print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
    }
    
    mutating func startStudentDeletion(){
        
        print("삭제할 학생의 이름을 입력해주세요")
        let newName = readLine()
        
        switch self.deleteStudent(newName){
        case .success(let name): print("\(name) 학생을 삭제하였습니다.")
        case .notExistence(let name): print("\(name) 학생을 찾지 못했습니다.")
        case .invalidName: print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
        
        
    }
}
