import Foundation

class Student {
    let GRADE = ["F", nil, "D0", "D+", "C0", "C+", "B0", "B+", "A0", "A+"]
    let name: String
    private var grades: Dictionary<String, String>
    
    init(name: String){
        self.name = name
        self.grades = [String: String]()
    }
    
    func add(subject: String, grade: String) -> Bool {
        if GRADE.contains(grade) {
            self.grades[subject] = grade
            return true
        }
        return false
    }
    
    func delete(subject: String) -> Bool {
        guard self.grades[subject] != nil else { return false }
        self.grades[subject] = nil
        return true
    }
    
    func printGrade() {
        for (subject, grade) in grades {
            print("\(subject): \(grade)")
        }
        print("평점: \(calcScore())")
    }
    
    func calcScore() -> Double {
        var result = 0.0
        for (_, grade) in grades {
            guard let score = GRADE.firstIndex(of: grade) else { continue }
            result += Double.init(score) * 0.5
        }
        return result/Double.init(grades.count)
    }
}
