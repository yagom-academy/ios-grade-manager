//
//  StudentDeletionResult.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

enum StudentDeletionResult: Equatable{
    case invalidName
    case notExistence(of: String)
    case success(of: String)
}
