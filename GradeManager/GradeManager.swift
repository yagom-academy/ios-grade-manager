//
//  GradeManager.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

struct GradeManager {
    
    var students: Set<Student> = Set()
    private var programState: ProgramState!
    
    func validateMenuNumber(of input: String?) -> Bool {
                
        guard let input = input, input.isNotEmpty else {
            return false
        }
        
        if ProgramState.allCases.contains(where: { $0.rawValue == input.uppercased() }) {
            return true
        }
        
        guard let menuNum = Int(input), GradeManagingMenu.allCases.contains(where: { $0.rawValue == menuNum }) else {
            return false
        }
        
        return true
        
    }
    
    func validateStudentName(of name: String?) -> Bool {
        
        let pattern = "^[A-Za-z0-9]*$"
        
        guard let name = name, name.isNotEmpty, let _ = name.range(of: pattern, options: .regularExpression)  else {
            return false
        }
        
        return true
    }
    
    mutating func addStudent(_ name: String) -> (inserted: Bool, memberAfterInsert: Student) {
        
        let newStudent = Student(name: name)
        
        return self.students.insert(newStudent)
    }
    
    mutating func deleteStudent(_ name: String) -> Student? {
        return self.students.remove(Student(name: name))
    }
}

extension GradeManager {
    
    mutating func startProgram(){
        programState = .run
        
        while programState == .run {
        
            var startMessage = GradeManagingMenu.allCases.reduce("원하는 기능을 입력해주세요.\n") { partialMessage, menu in
                return "\(partialMessage)\(menu.menuName), "
            }
            
            startMessage += ProgramState.stop.stateName
            
            print(startMessage)
        
            let input = readLine()
        
            guard let input = input, self.validateMenuNumber(of: input) else {
                print("뭔가 입력이 잘못되었습니다. 1~\(GradeManagingMenu.allCases.count) 사이의 숫자 혹은 \(ProgramState.stop.rawValue)를 입력해주세요.")
                continue
            }
            
            if let programState = ProgramState(rawValue: input.uppercased()) {
                self.programState = programState
            }
        
            if let menuNum = Int(input), let selected = GradeManagingMenu(rawValue: menuNum) {
                self.performSelectedMenu(of: selected)
            }
        }
        
        print("프로그램을 종료합니다...")
        
    }
    
    mutating func performSelectedMenu(of menu: GradeManagingMenu) {
        
        switch menu {
        case .addStudent: self.performStudentAdditionMenu()
        case .deleteStudent: self.performStudentDeletion()
        case .addOrUpdateGrade: break
        case .deleteGrade: break
        case .showGradePointAverage: break
        }
    }
    
    mutating func performStudentAdditionMenu() {

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
    
    mutating func performStudentDeletion() {
        
        print("삭제할 학생의 이름을 입력해주세요")
        let name = readLine()
        
        guard let name = name, self.validateStudentName(of: name) else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        
        switch self.deleteStudent(name) {
        case .some(let removedStudent): print("\(removedStudent.name) 학생을 삭제하였습니다.")
        case .none: print("\(name) 학생을 찾지 못했습니다.")
        }
    }
}
