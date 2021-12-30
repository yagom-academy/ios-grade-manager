//
//  DeleteSubjectScore.swift
//  GradeManager
//
//  Created by kakao on 2021/12/30.
//

import Foundation

struct DeleteSubjectScoreMenu: FirstMenu {
    private var storage: ScoreStorage
    var isExit: Bool = false
    
    init(storage: ScoreStorage) {
        self.storage = storage
    }
    
    mutating func action() {
        deleteSubjectScore()
    }
    
    private mutating func deleteSubjectScore() {
        var errorMessage: String
        print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift")
        guard let input = readLine(),
              let subjectScore = makeSubjectScore(by: input) else {
            errorMessage = InputError.inputError.errorDescription
            print(errorMessage)
            return
        }
        
        let result = storage.deleteSubject(subjectScore)
        switch result {
        case .success(_):
            printSuccessMessage(by: subjectScore)
            return
        case .failure(let error):
            switch error {
            case .nonSubjectScore:
                errorMessage = subjectScore.subject + "가 없습니다"
            case .nonStudent:
                errorMessage = subjectScore.student + InputError.deleteStudentError.errorDescription
            }
        }
        print(errorMessage)
    }
    
    func makeSubjectScore(by input: String) -> SubjectScore? {
        let list = input.split(separator: " ").map{String($0)}
        guard list.count == 2 else { return nil }
        let subjectScore = SubjectScore(student: list[0], subject: list[1], score: "")
        return subjectScore
    }
    
    private func printSuccessMessage(by subjectScore: SubjectScore) {
        print("\(subjectScore.student) 학생의 \(subjectScore.subject) 과목이 삭제되었습니다.")
    }
}
