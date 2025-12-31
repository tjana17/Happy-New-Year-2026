//
//  RandomGenerator.swift
//  Happy New Year 2026
//
//  Created by Janarthanan Kannan on 31/12/25.
//

import Foundation

class RandomGenerator {
    static func uniqueRandoms(numberOfRandoms: Int, minNum: Int, maxNum: Int) -> [CGFloat] {
        var uniqueNumbers = Set<CGFloat>()
        while uniqueNumbers.count < numberOfRandoms {
            uniqueNumbers.insert(CGFloat(Int(arc4random_uniform(UInt32(maxNum) + 1)) + minNum))
        }
        return uniqueNumbers.shuffled()
    }
}
