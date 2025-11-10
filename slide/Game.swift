//
//  Game.swift
//  slide
//
//  Created by alumne on 10/11/2025.
//

import Foundation

struct Game {
    static let lowNumber: Double = 1
    static let highNumber: Double = 100
    private(set) var guessNumber = Int.random(in: 1...100)
    private(set) var points = 0
    
    mutating func calculatePoint(sliderValue: Double){
        self.points = Int(Game.highNumber) - abs(guessNumber-Int(round((sliderValue))))
    }
    
    mutating func restart(){
        guessNumber = Int.random(in: 1...100)
    }
}
