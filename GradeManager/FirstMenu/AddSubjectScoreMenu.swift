//
//  AddSubjectScoreMenu.swift
//  GradeManager
//
//  Created by kakao on 2021/12/30.
//

import Foundation

struct AddSubjectScoreMenu: FirstMenu {
    private var storage: ScoreStorage
    var isExit: Bool = false
    
    init(storage: ScoreStorage) {
        self.storage = storage
    }
    
    mutating func action() {
        addSubjectScore()
    }
    
    private mutating func addSubjectScore() {
        var errorMessage: String
        print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A0, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
        guard let input = readLine(),
              let subjectScore = makeSubjectScore(by: input) else {
            errorMessage = InputError.inputError.errorDescription
            print(errorMessage)
            return
        }
        
        let result = storage.addSubjectScore(subjectScore)
        if result {
            printSuccessMessage(by: subjectScore)
            return
        }
        errorMessage = subjectScore.student + InputError.addSubjectScoreError.errorDescription
        print(errorMessage)
    }
    
    func makeSubjectScore(by input: String) -> SubjectScore? {
        let list = input.split(separator: " ").map{String($0)}
        guard list.count == 3 else { return nil }
        let subjectScore = SubjectScore(student: list[0], subject: list[1], score: list[2])
        return subjectScore
    }
    
    private func printSuccessMessage(by subjectScore: SubjectScore) {
        print("\(subjectScore.student) 학생의 \(subjectScore.subject) 과목이 \(subjectScore.score)로 추가(변경)되었습니다.")
    }
}
