import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var sliderValue: Double = 50.0
    @State var alertIsVisible: Bool = false
    
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                            .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("🎯 Acierta el número")
                    .font(.largeTitle)
                
                Text("Tu objetivo: \(game.guessNumber)")
                    .font(.title2)
                
                // Slider
                SliderView(value: $sliderValue, lowValue: Game.lowNumber, highValue: Game.highNumber)
                
                // Botón para probar suerte
                Button("Probar") {
                    self.game.calculatePoint(sliderValue: sliderValue)
                    alertIsVisible = true
                }
                .padding()
                .background(Color.accentColor)
                .foregroundColor(Color.white)
                .cornerRadius(12)
                .alert(isPresented: $alertIsVisible){
                    Alert(title: Text("Has apuntado a \(Int(sliderValue))!"),
                          message: Text("Te llevas \(game.points) puntos!"),
                          dismissButton: .default(Text("Siguiente")){
                            game.restart()
                            sliderValue = 50.0
                          })
                }
                
                Image(systemName: "list.dash")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                
            }
            .padding()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
                .previewLayout(.device)
                .previewDevice("iPhone 11 Pro")
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
