import Foundation

class GameStore: ObservableObject {
    @Published private(set) var game = Game()
    
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
