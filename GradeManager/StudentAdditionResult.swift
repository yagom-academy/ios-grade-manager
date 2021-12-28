//
//  StudentAdditionResult.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

enum StudentAdditionResult: Equatable{
    case invalidName
    case redundantName(name: String)
    case success(name: String)
}
