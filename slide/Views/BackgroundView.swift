import SwiftUI

struct BackgroundView: View {
    @EnvironmentObject var gameStore: GameStore
    var body: some View {
        VStack {
            HStack {
                Button(action:{gameStore.restartGame()}){
                    RoundedImageView(imageName: "arrow.clockwise")
                }
                Spacer()
                RoundedImageView(imageName: "list.dash")
            }
            Spacer()
            HStack {
                RoundedTextView(text: "SCORE", value: gameStore.game.score)
                Spacer()
                RoundedTextView(text: "ROUND", value: gameStore.game.rounds)
            }
        
        }.padding()
    }
}

struct RoundedImageView: View {
    let imageName: String
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .frame(width: 56, height: 56)
                .overlay(Circle().stroke())
        }
    }
}

struct RoundedTextView: View{
    let text : String
    let value : Int
    var body: some View {
        VStack {
            Text(text)
            Text("\(value)")
                .padding()
                .frame(width: 68, height: 56)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue))
        }
    }
}
struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView().environmentObject(GameStore())
    }
}
