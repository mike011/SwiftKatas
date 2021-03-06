//
//  PrimeFactorsKataTests.swift
//  PrimeFactorsKataTests
//
//  Created by Michael Charland on 2017-07-12.
//  Copyright © 2017 charland. All rights reserved.
//

import XCTest
@testable import PrimeFactorsKata

class PrimeFactorsKataTests: XCTestCase {

    func list(_ ints: [Int]) -> [Int] {
        var list = [Int]()
        for i in ints {
            list.append(i)
        }
        return list
    }

    func testOne() {
        XCTAssertEqual(list([]), PrimeFactors().generate(1))
    }

    func testTwo() {
        XCTAssertEqual(list([2]), PrimeFactors().generate(2))
    }

    func testThree() {
        XCTAssertEqual(list([3]), PrimeFactors().generate(3))
    }

    func testFour() {
        XCTAssertEqual(list([2,2]), PrimeFactors().generate(4))
    }

    func testSix() {
        XCTAssertEqual(list([2,3]), PrimeFactors().generate(6))
    }

    func testEight() {
        XCTAssertEqual(list([2,2,2]), PrimeFactors().generate(8))
    }

    func testNine() {
        XCTAssertEqual(list([3,3]), PrimeFactors().generate(9))
    }


}
