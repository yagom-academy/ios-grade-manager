import Foundation

class Student {
    let name: String
    private var grades: Dictionary<String, String>
    
    init(name: String){
        self.name = name
        self.grades = [String: String]()
    }
    
    func add(subject: String, grade: String) {
        self.grades[subject] = grade
    }
    
    func delete(subject: String) -> Bool {
        guard self.grades[subject] != nil else { return false }
        self.grades[subject] = nil
        return true
    }
}
