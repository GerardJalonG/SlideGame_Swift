//
//  ContentView.swift
//  slide
//
//  Created by alumne on 27/10/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue: Double = 50
    @State private var target: Int = Int.random(in: 1...100)
    @State private var message: String = ""
    
    var body: some View {
        
        ZStack{
            Color("BackgroundColor").ignoresSafeArea()
        }
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
                checkResult()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
            
            Text(message)
                .font(.title3)
                .foregroundColor(.purple)
        }
        .padding()
    }
    
    // Función para comprobar si acertó
    func checkResult() {
        let difference = abs(target - Int(sliderValue))
        if difference == 0 {
            message = "🎉 ¡Perfecto!"
        } else if difference < 5 {
            message = "🔥 Casi! Diferencia de \(difference)"
        } else {
            message = "😅 Estuviste a \(difference) puntos"
        }
        
        // Genera un nuevo objetivo para seguir jugando
        target = Int.random(in: 1...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
