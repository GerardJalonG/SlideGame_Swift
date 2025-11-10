import SwiftUI

struct ContentView: View {
    @State private var sliderValue: Double = 50
    @State private var target: Int = Int.random(in: 1...100)
    @State private var message: String = ""
    @State var alertIsVisible: Bool = false
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("🎯 Acierta el número")
                .font(.largeTitle)
            
            Text("Tu objetivo: \(target)")
                .font(.title2)
            
            // Slider
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }.padding(.horizontal)
            
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
