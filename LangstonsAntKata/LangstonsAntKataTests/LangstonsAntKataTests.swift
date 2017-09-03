//
//  LangstonsAntKataTests.swift
//  LangstonsAntKataTests
//
//  Created by Michael Charland on 2017-07-19.
//  Copyright © 2017 charland. All rights reserved.
//

import XCTest
@testable import LangstonsAntKata

class LangstonsAntKataTests: XCTestCase {

    var world : World!
    var ant : Ant!

    override func setUp() {
        super.setUp()
        world  = World(10)
        ant = Ant(world)
    }

    func testAntShouldStartInMiddleOfWorld() {
        XCTAssertEqual(ant.location().x, 5)
        XCTAssertEqual(ant.location().y, 5)
    }

    func testAntShouldStartInMiddleOfWorldDifferentExample() {
        world  = World(100)
        ant = Ant(world)
        XCTAssertEqual(ant.location().x, 50)
        XCTAssertEqual(ant.location().y, 50)
    }

    func testTakeOneStep() {
        ant.step()
        XCTAssertTrue(world.isBlack(x:5,y:5))
        XCTAssertEqual(ant.location().x, 4)
        XCTAssertEqual(ant.location().y, 5)
    }

    func takeSteps(_ n : Int) {
        for _ in 0..<n {
            ant.step()
        }
    }

    func testTakeTwoSteps() {
        takeSteps(2)
        XCTAssertTrue(world.isBlack(x:4,y:5))
        XCTAssertEqual(ant.location().x, 4)
        XCTAssertEqual(ant.location().y, 4)
    }

    func testTakeThreeSteps() {
        takeSteps(3)
        XCTAssertTrue(world.isBlack(x:4,y:4))
        XCTAssertEqual(ant.location().x, 5)
        XCTAssertEqual(ant.location().y, 4)
    }

    func testTakeFourSteps() {
        takeSteps(4)
        XCTAssertTrue(world.isBlack(x: 5,y:4))
        XCTAssertEqual(ant.location().x, 5)
        XCTAssertEqual(ant.location().y, 5)
    }

    func testTakeStepsInAWorldPaintedBlack() {
        world.paintBlack()
        takeSteps(4)
        XCTAssertFalse(world.isBlack(x: 5, y: 5))
    }

    func testShouldWarpHorizontallyLeft() {
        ant.x = 0
        ant.step()
        XCTAssertEqual(ant.location().x, 9)
    }

    func testShouldWarpVerticallyUp() {
        ant.y = 0
        ant.direction = Compass.West
        ant.step()
        XCTAssertEqual(ant.location().y, 9)
    }

    func testShouldWarpHorizontallyRight() {
        ant.x = world.size - 1
        ant.direction = Compass.South
        ant.step()
        XCTAssertEqual(ant.location().x, 0)
    }

    func testShouldWarpVerticallyDown() {
        ant.y = world.size - 1
        ant.direction = Compass.East
        ant.step()
        XCTAssertEqual(ant.location().y, 0)
    }

}

enum Colour {
    case black, white
}

class World {

    var size : Int {
        get {
            return map.count
        }
    }
    var map : [[Colour]]

    init(_ s : Int) {
        let line = Array.init(repeating: Colour.white, count: s)
        map = Array.init(repeating: line, count: s)
    }

    func isBlack(x : Int, y : Int) -> Bool {
        return map[y][x] == Colour.black
    }

    func paintBlack(x: Int, y : Int) {
        map[y][x] = Colour.black
    }

    func paintWhite(x: Int, y : Int) {
        map[y][x] = Colour.white
    }

    func paintBlack() {
        for y in 0 ..< size  {
            for x in 0 ..< size {
                paintBlack(x: x, y: y)
            }
        }
    }
}

enum Compass: Int {
    case North, West, South, East
}

class Ant {

    var world : World
    var x : Int
    var y : Int
    var direction : Compass

    init(_ w : World) {
        world = w
        x = w.size/2
        y = w.size/2
        direction = .North
    }

    func location() -> (x: Int, y:Int) {
        return (x, y)
    }

    func step() {
        var n = direction.rawValue
        if world.isBlack(x: x, y: y) {
            world.paintWhite(x: x, y: y)
            n = (direction.rawValue - 1) % 4
            if(n < 0) {
                n = 3
            }
        } else {
            world.paintBlack(x: x, y: y)
            n = (direction.rawValue + 1) % 4
        }
        direction = Compass(rawValue: n)!
        switch direction {
            case .West:
                x -= 1
                if x < 0 {
                    x = world.size - 1
                }
            case .South:
                y -= 1
                if y < 0 {
                    y = world.size - 1
            }
            case .East:
                x += 1
                x = x % world.size
            case .North:
                y += 1
                y = y % world.size
        }
    }

}
