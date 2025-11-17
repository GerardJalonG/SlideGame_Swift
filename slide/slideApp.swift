import SwiftUI

@main
struct slideApp: App {
    @StateObject var gameStore = GameStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(gameStore)
        }
    }
}
