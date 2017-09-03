//
//  PrimeFactors.swift
//  PrimeFactorsKata
//
//  Created by Michael Charland on 2017-07-12.
//  Copyright © 2017 charland. All rights reserved.
//

import Foundation

class PrimeFactors {

    func generate(_ m : Int) -> [Int]{
        var n = m
        var r = [Int]()
        var candidate = 2
        while n > 1 {
            while n % candidate == 0 {
                r.append(candidate)
                n /= candidate
            }
            candidate += 1
        }
            if n > 1 {
                r.append(n)
            }

        return r
    }
}

