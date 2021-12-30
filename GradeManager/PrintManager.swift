//
//  PrintManager.swift
//  GradeManager
//
//  Created by 이승주 on 2021/12/30.
//

struct PrintManager {
    func explanatoryTextForPlayConsole() {
        print(K.explanatoryTextForPlayConsole)
    }
    
    func explanatoryTextForAddGradeForSubject() {
        print(K.explanatoryTextForAddGradeForSubject)
    }
    
    func explanatoryTextForAddStudent() {
        print(K.explanatoryTextForAddStudent)
    }
    
    func explanatoryTextForDeleteStudent() {
        print(K.explanatoryTextForDeleteStudent)
    }
    
    func explanatoryTextForDeleteGradeForSubject() {
        print(K.explanatoryTextForDeleteGradeForSubject)
    }
    
    func printSuccessAddStudent(_ name: String) {
        print(name + K.printSuccessAddStudent)
    }
    
    func printSuccessDeleteStudent(_ name: String) {
        print(name + K.printSuccessDeleteStudent)
    }
    
    func printAlreadyExistStudent(_ name: String) {
        print(name + K.printAlreadyExistStudent)
    }
    
    func printDoNotExistStudent(_ name: String) {
        print(name + K.printDoNotExistStudent)
    }
    
    func printDoNotExistGradeForSubject(_ subject: String) {
        print(subject + K.printDoNotExistGradeForSubject)
    }
    
    func printInsertOrUpdateGrade(_ name: String, _ subject: String, _ grade: String) {
        print("\(name) 학생의 \(subject) 과목이 \(grade)로 추가(변경) 되었습니다.")
    }
    
    func printSuccessDeleteGrade(_ name: String, _ subject: String) {
        print("\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
    }
    
    func printGPA(_ name: String , _ GPA: Double) {
        print("\(name)\n평점 : \(GPA)")
    }
    
    func explanatoryTextForCalculateGPA() {
        print(K.explanatoryTextForCalculateGPA)
    }
    
    func explanatoryTextForInvaildInput() {
        print(K.explanatoryTextForInvaildInput)
    }
    
    func explanatoryTextForExitProgram() {
        print(K.explanatoryTextForExitProgram)
    }
    
    func explanatoryTextForIsInvaildMenuFormat() {
        print(K.explanatoryTextForIsInvaildMenuFormat)
    }
}
