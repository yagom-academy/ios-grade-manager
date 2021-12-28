//
//  GradeManagerTests.swift
//  GradeManagerTests
//
//  Created by kakao on 2021/12/28.
//

import XCTest
@testable import GradeManager

class GradeManagerTests: XCTestCase {
    
    var sut: GradeManager!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = GradeManager()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
 
    
    func test_validateMenuNumber호출시_빈문자열을전달한경우_invalid를반환하는지(){
        let input = ""
        
        let result = sut.validateMenuNumber(of: input)
        
        XCTAssertEqual(result, .invalid)
    }
    
    func test_validateMenuNumber호출시_nil값을전달한경우_invalid를반환하는지(){
        let input: String? = nil
        
        let result = sut.validateMenuNumber(of: input)
        
        XCTAssertEqual(result, .invalid)
    }
    
    func test_validateMenuNumber호출시_1보다작은값또는5보다큰값을전달한경우_invalid를반환하는지(){
        let inputs = ["-1","0","6","7"]
        
        let result = inputs.compactMap { menuNum in
            sut.validateMenuNumber(of:menuNum)
        }
        
        XCTAssertEqual(result, Array(repeating: .invalid, count: 4))
    }
    
    func test_validateMenuNumber호출시_숫자또는X가아닌다른값을전달한경우_invalid을반환하는지(){
        let inputs = ["a","#","가","A"]
        
        let result = inputs.compactMap { menuNum in
            sut.validateMenuNumber(of:menuNum)
        }
        
        XCTAssertEqual(result, Array(repeating: .invalid, count: 4))
    }
    
    func test_validateMenuNumber호출시_1에서5사이값을전달한경우_해당숫자를rawvalue로하는valid_를반환하는지(){
        let inputs = ["1","2","3","4","5"]
            
        let result = inputs.compactMap { menuNum in
            sut.validateMenuNumber(of:menuNum)
        }
        
        XCTAssertEqual(result, [.valid(of: 1),.valid(of: 2),.valid(of: 3),.valid(of: 4),.valid(of: 5)])
    }
    
    func test_validateMenuNumber호출시_X를전달한경우_음수1을반환하는지(){
        let inputs = ["X","x"]
        
        let result = inputs.compactMap { menuNum in
            sut.validateMenuNumber(of:menuNum)
        }
        
        XCTAssertEqual(result, Array(repeating: .exit, count: 2))
    }
    
    


}
