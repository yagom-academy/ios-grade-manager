//
//  GradeManager.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

class GradeManager {
    
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
        
        guard let name = name, name.isNotEmpty, name.consistsOfEnglishAndNumbers  else {
            return false
        }
        return true
    }
    
    func validateAddOrGradeInput(of input: String?) -> Bool {
        
        guard let input = input, input.isNotEmpty, let (name, subject, grade) = self.splitAddOrUpdateGradeInputBySpace(of: input) else {
            return false
        }
        
        guard name.consistsOfEnglishAndNumbers, subject.consistsOfEnglishAndNumbers, Grade.allCases.contains(where: { $0.rawValue == grade }) else {
            return false
        }
        
        return true
    }
    
    func splitAddOrUpdateGradeInputBySpace(of input: String) -> (name: String, subject: String, grade: String)? {

        let nameSubjectGradeArray = input.trimmingCharacters(in: [" "]).components(separatedBy: " ").filter { $0.isNotEmpty }.map { $0.uppercasingFirstAndLowercasingRest() }
        
        if nameSubjectGradeArray.count != 3 {
            return nil
        }
        return (nameSubjectGradeArray[0], nameSubjectGradeArray[1], nameSubjectGradeArray[2])
    }
    
    func addStudent(_ name: String) -> (inserted: Bool, memberAfterInsert: Student) {
        
        let newStudent = Student(name: name)
        
        return self.students.insert(newStudent)
    }
    
    func deleteStudent(_ name: String) -> Student? {
        return self.students.remove(Student(name: name))
    }
    
    func addGradeOf(name: String, subject: String, grade: Grade) -> Bool {
        
        guard var student = self.students.filter({ $0.name == name.uppercasingFirstAndLowercasingRest() }).first else {
            return false
        }
        
        student.grade.updateValue(grade, forKey: subject)
        self.students.update(with: student)
        return true
    }
}

extension GradeManager {
    
    func startProgram(){
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
    
    func performSelectedMenu(of menu: GradeManagingMenu) {
        
        switch menu {
        case .addStudent: self.performStudentAdditionMenu()
        case .deleteStudent: self.performStudentDeletion()
        case .addOrUpdateGrade: self.performAddOrGrade()
        case .deleteGrade: break
        case .showGradePointAverage: break
        }
    }
    
    func performStudentAdditionMenu() {

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
    
    func performStudentDeletion() {
        
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
    
    func performAddOrGrade() {
        
        let startMessage = """
        성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A0, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
        입력예) Mickey Swift A+
        만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
        """
        print(startMessage)
        let input = readLine()
        
        guard let input = input, self.validateAddOrGradeInput(of: input) else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        
        guard let (name, subject, gradeString) = self.splitAddOrUpdateGradeInputBySpace(of: input), let grade = Grade(rawValue: gradeString) else {
            return
        }
        
        if self.addGradeOf(name: name, subject: subject, grade: grade) {
            print("\(name) 학생의 \(subject) 과목이 \(grade)로 추가(변경)되었습니다.")
            return
        }
        
        print("\(name) 학생을 찾지 못했습니다.")
    }
}
