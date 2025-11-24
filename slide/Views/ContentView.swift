import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gameStore:GameStore
    
    @State var sliderValue: Double = 50.0
    @State var alertIsVisible: Bool = false
    @State private var showLastScores = false

    
    var body: some View {
        ZStack{
            Color("BackgroundColor")
            BackgroundView()
            VStack(spacing: 20) {
                Text("🎯 Acierta el número")
                    .font(.largeTitle)
                
                Text("Tu objetivo: \(gameStore.game.guessNumber)")
                    .font(.title2)
                
                // Slider
                SliderView(value: $sliderValue, lowValue: Game.lowNumber, highValue: Game.highNumber)
                
                // Botón para probar suerte
                Button("Probar") {
                    self.gameStore.calculatePoint(sliderValue: sliderValue)
                    alertIsVisible = true
                }
                .padding()
                .background(Color.accentColor)
                .foregroundColor(Color.white)
                .cornerRadius(12)
                .alert(isPresented: $alertIsVisible){
                    Alert(title: Text("Has apuntado a \(Int(sliderValue))!"),
                          message: Text("Te llevas \(gameStore.game.points) puntos!"),
                          dismissButton: .default(Text("Siguiente")){
                            gameStore.restart()
                            sliderValue = 50.0
                          })
                }
                
            }
            .padding()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environmentObject(GameStore())
                .preferredColorScheme(.light)
                .previewLayout(.device)
                .previewDevice("iPhone 8")
        }
    }
}

struct SliderView: View {
    @Binding var value: Double
    let lowValue: Double
    let highValue: Double
    var body: some View {
        HStack {
            Text("\(Int(lowValue))")
            Slider(value: $value, in: lowValue...highValue)
            Text("\(Int(highValue))")
        }.padding(.horizontal)
    }
}
