import SwiftUI

struct HomeView: View {
    @Binding var showInfo: Bool

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(spacing: 20) {
                // Info button
                HStack {
                    Spacer()
                    Button(action: { showInfo = true }) {
                        Image(systemName: "info.circle")
                            .foregroundColor(VEXColors.red)
                            .font(.title)
                    }
                    .padding()
                }

                Spacer()

                // Logo
                Image("logo")   // Make sure you have "logo" in Assets.xcassets
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)

                // App title
                Text("HABS Gliders")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(VEXColors.blue)

                Text("V5 Strategy Hub")
                    .foregroundColor(VEXColors.grey)

                Spacer()
            }
        }
    }
}
