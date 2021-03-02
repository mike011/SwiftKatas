//
//  BowlingGameTests.swift
//  KataTests
//
//  Created by Michael Charland on 2021-03-02.
//

import XCTest

class BowlingGameTests: XCTestCase {

    var g: Game!

    override func setUp() {
        g = Game()
    }

    fileprivate func roll(pins: Int, times: Int) {
        for _ in 0..<times {
            g.roll(pins: pins)
        }
    }

    fileprivate func assert(score: Int, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(g.score, score, file: file, line: line)
    }

    func testAllGutterBalls() throws {
        roll(pins: 0, times: 20)
        assert(score: 0)
    }

    func testAllOnes() {
        roll(pins: 1, times: 20)
        assert(score: 20)
    }

    fileprivate func rollSpare() {
        g.roll(pins: 5)
        g.roll(pins: 5)
    }

    fileprivate func roll(pins: Int) {
        g.roll(pins: pins)
    }

    func testSpare() {
        rollSpare()
        roll(pins: 1)
        roll(pins: 0, times: 18)
        assert(score: 12)
    }

    fileprivate func rollStrike() {
        roll(pins: 10)
    }

    func testStrike() {
        rollStrike()
        roll(pins: 2)
        roll(pins: 3)
        roll(pins: 0, times: 18)
        assert(score: 20)
    }

    func testPerfectGame() {
        roll(pins: 10, times: 20)
        assert(score: 300)
    }

}
