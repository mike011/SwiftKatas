//
//  BowlingGameKata.swift
//  BowlingGameKata
//
//  Created by Michael Charland on 2017-07-17.
//  Copyright © 2017 charland. All rights reserved.
//

import Foundation

class BowlingGameKata {

    var score = 0
    var ball = 0
    var balls = [Int](repeatElement(0, count: 22))

    func bowl(_ n : Int) {
        balls[ball] = n
        ball += 1
    }

    func getScore() -> Int {
        var score = 0
        var frame = 0
        for _ in 0...10 {
            if balls[frame] == 10 {
                score += 10
                score += balls[frame+1]
                score += balls[frame+2]
                frame += 1
                continue
            }
            if balls[frame] + balls[frame+1] == 10 {
                score += balls[frame+2]
            }
            score += balls[frame]
            score += balls[frame+1]
            frame += 2
        }
        return score
    }
}
