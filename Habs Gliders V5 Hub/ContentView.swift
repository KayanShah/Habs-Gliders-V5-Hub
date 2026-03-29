import SwiftUI

struct ContentView: View {
    @State private var showInfo = false
    private let apiKey = Secrets.openAIKey
    private let trainingInstructions = Secrets.trainingInstructions

    var body: some View {
        TabView {
            HomeView(showInfo: $showInfo)
                .tabItem { Label("Home", systemImage: "house.fill") }

            AIView(apiKey: apiKey, trainingInstructions: trainingInstructions)
                .tabItem { Label("AI", systemImage: "brain.head.profile") }

            StrategyView()
                .tabItem { Label("Strategy", systemImage: "gamecontroller.fill") }

            CompetitionsView()
                .tabItem { Label("Competitions", systemImage: "list.bullet") }
        }
        .accentColor(VEXColors.red)
        .sheet(isPresented: $showInfo) { InfoView() }
    }
}
