//
//  bullsEyeTests.swift
//  bullsEyeTests
//
//  Created by Diljit Singh on 2022-08-28.
//

import XCTest
@testable import bullsEye


class bullsEyeTests: XCTestCase {
    
    var game: Game!

    override func setUpWithError() throws {
        
        game = Game()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        
        game = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   
    
    func testScorePositive ()
    {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative ()
    {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    
    func testScoreExact ()
    {
        let guess = game.target
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 200)
    }
    
    func testScoreClose ()
    {
        let guess = game.target + 2
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 98 + 50)
    }
    
    
    func testExample() throws {
       
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

     func testNewRound()
    {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }
    
    func testRestart()
   {
       game.startNewRound(points: 100)
       XCTAssertNotEqual(game.score, 0)
       XCTAssertNotEqual(game.round, 1)
       game.restart()
       XCTAssertEqual(game.score, 0)
       XCTAssertEqual(game.round, 1)
     
       
   }
    
    
}
