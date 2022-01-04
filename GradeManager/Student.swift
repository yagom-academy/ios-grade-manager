//
//  Student.swift
//  GradeManager
//
//  Created by kakao on 2022/01/03.
//

import Foundation


struct Student: Hashable {

    let name: String
    var subjectSet = Set<Subject>()
    
    init(name: String) {
        self.name = name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    mutating func addOrChangeSubject(subject: Subject) {
        subjectSet.insert(subject)
        print(subjectSet)
    }
    
    mutating func removeSubject(forName subjectName: String) throws{
        let dummySubject = Subject(name: subjectName, grade: .aPlus)
        guard let _ = subjectSet.remove(dummySubject) else {
            throw StudentError.noMatchedSubject(subject: subjectName)
        }
    }
    
    func displayAllSubject() {
        print(subjectSet)
        guard subjectSet.isEmpty == false else {
            print("입력된 성적 정보가 없습니다.")
            return
        }
        let rateSum = subjectSet.reduce(0.0) { partialResult, subject in
            subject.display()
            let grade = subject.grade
            return partialResult + grade.rateValue
        }
        let averageRate = rateSum / Double(subjectSet.count)
        print(String(format: "%.2f", averageRate))
    }
}

enum StudentError: Error {
    case noMatchedSubject(subject: String)
}

extension StudentError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noMatchedSubject(let subject):
            return "\(subject) 과목을 찾지 못했습니다."
        }
    }
}
