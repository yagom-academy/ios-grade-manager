//
//  GradeManager.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

struct GradeManager{
    
    var students : Set<Student> = Set()
    
    func validateMenuNumber(of input: String?) -> Bool {
                
        guard let input = input, !input.isEmpty else {
            return false
        }
        
        if input.lowercased() == "x" {
            return true
        }
        
        guard let menuNum = Int(input), 1..<GradeManagingMenu.allCases.count ~= menuNum else {
            return false
        }
        
        return true
        
    }
    
    func validateStudentName(of name: String?) -> Bool{
        
        let pattern = "^[A-Za-z0-9]*$"
        
        guard let name = name, name.isNotEmpty, let _ = name.range(of: pattern, options: .regularExpression)  else {
            return false
        }
        
        return true
    }
    
    mutating func addStudent(_ name: String) -> (inserted: Bool, memberAfterInsert: Student) {
        
        let newStudent = Student(name: name)
        
        return students.insert(newStudent)
    }
    
    mutating func deleteStudent(_ name: String) -> Student? {
        return self.students.remove(Student(name: name))
    }
}

extension GradeManager{
    
    mutating func start(){
        
        loop: while true {
        
            let startMessage = GradeManagingMenu.allCases.reduce("원하는 기능을 입력해주세요.\n") { partialMessage, menu in
                return "\(partialMessage) \(menu.menuName)"
            }
            print(startMessage)
        
            let menu = readLine()
        
            guard let menu = menu, self.validateMenuNumber(of: menu) else {
                print("뭔가 입력이 잘못되었습니다. 1~\(GradeManagingMenu.allCases.count) 사이의 숫자 혹은 X를 입력해주세요.")
                continue loop
            }
        
            guard let menuNum = Int(menu), let selected = GradeManagingMenu(rawValue: menuNum) else {
                print("프로그램을 종료합니다...")
                break loop
            }
        
            self.startMenu(of: selected)
        }
    }
    
    mutating func startMenu(of menu: GradeManagingMenu) {
        
        switch menu {
        case .addStudent: self.startStudentAddition()
        case .deleteStudent: self.startStudentDeletion()
        case .addOrUpdateGrade: break
        case .deleteGrade: break
        case .showGradePointAverage: break
        default : break
        }
    }
    
    mutating func startStudentAddition(){

        print("추가할 학생의 이름을 입력해주세요")
        let newName = readLine()
        
        guard let newName = newName, self.validateStudentName(of: newName) else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        
        switch self.addStudent(newName) {
        case (true, let newStudent): print("\(newStudent.name) 학생을 추가했습니다.")
        case (false, let student): print("\(student.name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        }
    }
    
    mutating func startStudentDeletion() {
        
        print("삭제할 학생의 이름을 입력해주세요")
        let name = readLine()
        
        guard let name = name, self.validateStudentName(of: name) else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        
        switch self.deleteStudent(name){
        case .some(let removedStudent): print("\(removedStudent.name) 학생을 삭제하였습니다.")
        case .none: print("\(name) 학생을 찾지 못했습니다.")
        }
        
        
    }
}
