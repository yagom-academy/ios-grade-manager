//
//  FirstMenu.swift
//  GradeManager
//
//  Created by kakao on 2021/12/29.
//

import Foundation

protocol FirstMenu {
    var isExit: Bool { get }
    
    init(storage: ScoreStorage)
    
    mutating func action()
}

enum FirstMenuFactory {
    static func makeFirstMenu(by input: String,
                              with storage: ScoreStorage) -> FirstMenu? {
        switch input {
        case "1":
            return AddStudentMenu(storage: storage)
        case "2":
            return DeleteStudentMenu(storage: storage)
        case "3":
            return AddSubjectScoreMenu(storage: storage)
        case "4":
            return DeleteSubjectScoreMenu(storage: storage)
        case "5":
            return AddStudentMenu(storage: storage)
        case "X":
            return ExitMenu(storage: storage)
        default:
            return nil
        }
    }
}
