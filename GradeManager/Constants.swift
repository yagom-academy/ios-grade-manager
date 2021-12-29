//
//  Constants.swift
//  GradeManager
//
//  Created by 이승주 on 2021/12/29.
//

struct K {
    static let explanatoryTextForPlayConsole = """
원하는 기능을 입력해주세요
1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료
"""
    static let explanatoryTextForAddGradeForSubject = """
성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A0, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
입력예) Mickey Swift A+
만약 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
"""
    static let explanatoryTextForAddStudent = "추가할 학생의 이름을 입력해주세요"
    static let explanatoryTextForDeleteStudent = "삭제할 학생의 이름을 입력해주세요"
    static let explanatoryTextForDeleteGradeForSubject = "성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요."
    static let explanatoryTextForInvaildInput = "입력이 잘못되었습니다. 다시 확인해주세요."
    static let explanatoryTextForExitProgram = "프로그램을 종료합니다..."
    static let explanatoryTextForIsInvaildMenuFormat = "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요"
    static let grades: [String: Double] = [
        "A+": 4.5,
        "A0": 4.0,
        "B+": 3.5,
        "B0": 3.0,
        "C+": 2.5,
        "C0": 2.0,
        "D+": 1.5,
        "D0": 1.0,
        "F": 0.0
    ]
}
