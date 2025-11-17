import SwiftUI

struct LastScoresView: View {
    @EnvironmentObject var gameStore: GameStore

    var body: some View {
        VStack {
            Text("Últimas 5 puntuaciones")
                .font(.largeTitle)
                .padding()

            List(gameStore.lastScores, id: \.self) { score in
                HStack {
                    Text("Puntos: \(score)")
                        .font(.title2)
                    Spacer()
                }
            }
        }
    }
}
