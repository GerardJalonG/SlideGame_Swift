import SwiftUI

struct ContentView: View {
    @State private var sliderValue: Double = 50
    @State private var target: Int = Int.random(in: 1...100)
    @State var alertIsVisible: Bool = false
    
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                            .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("🎯 Acierta el número")
                    .font(.largeTitle)
                
                Text("Tu objetivo: \(target)")
                    .font(.title2)
                
                // Slider
                SliderView(value: sliderValue, lowValue: 1, highValue: 100)
                
                // Botón para probar suerte
                Button("Probar") {
                    alertIsVisible = true
                }
                .padding()
                .background(Color.accentColor)
                .foregroundColor(Color.white)
                .cornerRadius(12)
                .alert(isPresented: $alertIsVisible){
                    Alert(title: Text("Hello"),
                          message: Text("This is my first alert"),
                          dismissButton: .default(Text("Alert is Close")))
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
                .previewDevice("iPhone 11 Pro")
        }
    }
}

struct SliderView: View {
    @State var value: Double
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
