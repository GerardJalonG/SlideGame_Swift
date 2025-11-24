import Foundation

struct Game {
    static let lowNumber: Double = 1
    static let highNumber: Double = 100
    private(set) var guessNumber = Int.random(in: 1...100)
    private(set) var points = 0
    private(set) var score = 0
    private(set) var rounds = 0
    
    mutating func calculatePoint(sliderValue: Double){
        self.points = Int(Game.highNumber) - abs(guessNumber-Int(sliderValue))
        self.score += points
        self.rounds += 1
    }
    
    mutating func restart(){
        guessNumber = Int.random(in: Int(Game.lowNumber)...Int(Game.highNumber))
    }
    
    mutating func restartGame() {
        self.score = 0
        self.points = 0
        self.rounds = 0
        self.guessNumber = Int.random(in: Int(Game.lowNumber)...Int(Game.highNumber))
    }
}
