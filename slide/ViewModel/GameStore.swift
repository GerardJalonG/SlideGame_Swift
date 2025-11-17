import Foundation

class GameStore: ObservableObject {
    @Published private(set) var game = Game()
    @Published var lastScores: [Int] = []

    func addScore(score: Int) {
    lastScores.insert(score, at: 0)
        if lastScores.count > 5 {
             lastScores.removeLast()
         }
     }
    
    func calculatePoint(sliderValue: Double){
        game.calculatePoint(sliderValue: sliderValue)
    }
    
    func restart(){
        game.restart()
    }
    
    func restartGame(){
        game.restartGame()
    }
}
