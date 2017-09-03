//
//  BowlingGameKataTests.swift
//  BowlingGameKataTests
//
//  Created by Michael Charland on 2017-07-17.
//  Copyright © 2017 charland. All rights reserved.
//

import XCTest
@testable import BowlingGameKata

class BowlingGameKataTests: XCTestCase {

    let bg = BowlingGameKata()
    
    func testgutterBall() {
        bg.bowl(0)
        XCTAssertEqual(0, bg.getScore())
    }

    func testHitSomePins() {
        bg.bowl(5)
        bg.bowl(0)
        XCTAssertEqual(5, bg.getScore())
    }

    func testHitSomeMorePins() {
        bg.bowl(5)
        bg.bowl(4)
        XCTAssertEqual(9, bg.getScore())
    }

    func testSpare() {
        let bg = BowlingGameKata()
        bg.bowl(5)
        bg.bowl(5)
        bg.bowl(5)
        XCTAssertEqual(20, bg.getScore())
    }

    func testStrike() {
        let bg = BowlingGameKata()
        bg.bowl(10)
        bg.bowl(1)
        bg.bowl(1)
        XCTAssertEqual(14, bg.getScore())
    }

    func testPerfectGame() {
        let bg = BowlingGameKata()
        for _ in 1...11 {
            bg.bowl(10)
        }
        XCTAssertEqual(300, bg.getScore())
    }

}
