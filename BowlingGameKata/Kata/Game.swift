//
//  Game.swift
//  KataTests
//
//  Created by Michael Charland on 2021-03-02.
//

struct Game {

    fileprivate func frameScore(_ frameIndex: Int) -> Int {
        return balls[frameIndex] + balls[frameIndex+1]
    }

    fileprivate func isSpare(_ frameIndex: Int) -> Bool {
        return frameScore(frameIndex) == 10
    }

    fileprivate func spareBonus(_ frameIndex: Int) -> Int {
        return 10 + balls[frameIndex+2]
    }

    fileprivate func isStrike(_ frameIndex: Int) -> Bool {
        return balls[frameIndex] == 10
    }

    fileprivate func strikeBonus(_ frameIndex: Int) -> Int {
        return 10 + balls[frameIndex+1]+balls[frameIndex+2]
    }

    var score: Int {
        var score = 0
        var frameIndex = 0

        for _ in 0..<10 {
            if isStrike(frameIndex) {
                score += strikeBonus(frameIndex)
                frameIndex += 1
            } else {
                if isSpare(frameIndex) {
                    score += spareBonus(frameIndex)
                } else {
                    score += frameScore(frameIndex)
                }
                frameIndex += 2
            }
        }
        return score
    }

    var balls = [Int]()

    mutating func roll(pins: Int) {
        balls.append(pins)
    }
}
