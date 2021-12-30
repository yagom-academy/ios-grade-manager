import Foundation

class Student {
    let name: String
    private var grades: Dictionary<String, String>
    
    init(name: String){
        self.name = name
        self.grades = [String: String]()
    }
    
    func add(grade: String, subject: String) {
        self.grades[subject] = grade
    }
}
