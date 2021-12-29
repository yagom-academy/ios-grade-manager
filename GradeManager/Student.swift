import Foundation

struct Student {
    let name: String
}

extension Student: Hashable {
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.name == rhs.name
    }
}
