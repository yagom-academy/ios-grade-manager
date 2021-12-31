//
//  PrintMessages.swift
//  GradeManager
//
//  Created by 이승주 on 2021/12/31.
//

struct PrintMessages {
    enum Explanation: String {
        case playConsole = """
        원하는 기능을 입력해주세요
        1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료
        """
        case addGradeForSubject = """
        성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A0, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
        입력예) Mickey Swift A+
        만약 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
        """
        case addStudent = "추가할 학생의 이름을 입력해주세요"
        case deleteStudent = "삭제할 학생의 이름을 입력해주세요"
        case deleteGradeForSubject = "성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요."
        case calculateGPA = "평점을 알고 싶은 학생의 이름을 입력해주세요"
        case exitProgram = "프로그램을 종료합니다..."
        
        func printSelf() {
            print(self.rawValue)
        }
    }
    
    enum OperationResult {
        case InvaildMenuFormat
        case InvaildInput
        case SuccessAddStudent(name: String)
        case SuccessDeleteStudent(name: String)
        case AlreadyExistStudent(name: String)
        case DoNotExistStudent(name: String)
        case DoNotExistGradeForSubject(subject: String)
        case SuccsessInsertOrUpdateGrade(name: String, subject: String, grade: String)
        case SuccessDeleteGrade(name: String, subject: String)
        case GPA(name: String, GPA: Double)
        
        var description: String {
            switch self {
            case .InvaildMenuFormat:
                let message = "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요"
                return message
            case .InvaildInput:
                let message = "입력이 잘못되었습니다. 다시 확인해주세요."
                return message
            case .SuccessAddStudent(let name):
                let message = "\(name) 학생을 추가했습니다."
                return message
            case .SuccessDeleteStudent(let name):
                let message = "\(name) 학생을 삭제하였습니다."
                return message
            case .AlreadyExistStudent(let name):
                let message = "\(name) 학생은 이미 존재하는 학생입니다. 추가하지 않습니다."
                return message
            case .DoNotExistStudent(let name):
                let message = "\(name) 학생을 찾지 못했습니다."
                return message
            case .DoNotExistGradeForSubject(let subject):
                let message = "\(subject) 과목의 성적을 찾지 못했습니다."
                return message
            case .SuccsessInsertOrUpdateGrade(let name, let subject, let grade):
                let message = "\(name) 학생의 \(subject) 과목이 \(grade)로 추가(변경) 되었습니다."
                return message
            case .SuccessDeleteGrade(let name, let subject):
                let message = "\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다."
                return message
            case .GPA(let name, let GPA):
                let message = "\(name)\n평점 : \(GPA)"
                return message
            }
        }
        
        func printSelf() {
            print(self.description)
        }
    }
}
