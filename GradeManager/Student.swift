import Foundation

class Grade {
    private var grades: [String: String]
    private var gradeCase = ["F", nil, "D0", "D+", "C0", "C+", "B0", "B+", "A0", "A+"]
    
    init(grades: [String: String]){
        self.grades = grades
    }
    
    var score: Double {
        var result = 0.0
        if grades.count == 0 {
            return 0.0
        }
        for (_, grade) in grades {
            guard let score = gradeCase.firstIndex(of: grade) else { continue }
            result += Double.init(score) * 0.5
        }
        return result/Double(grades.count)
    }
    
    func add(subject: Subject) -> Bool {
        if gradeCase.contains(subject.grade) {
            self.grades[subject.name] = subject.grade
            return true
        }
        return false
    }
    
    func delete(subject: Subject) -> Bool {
        guard self.grades[subject.name] != nil else { return false }
        self.grades[subject.name] = nil
        return true
    }
    
    func printGrade() {
        for (subject, grade) in grades {
            print("\(subject): \(grade)")
        }
        print("평점: \(score)")
    }
    
}

class Student {
    let name: String
    var grades: Grade
    
    init(name: String){
        self.name = name
        self.grades = Grade(grades: [String: String]())
    }
}

struct Subject {
    var name: String
    var grade: String
    
    init(name: String, grade: String = "") {
        self.name = name
        self.grade = grade
    }
}
