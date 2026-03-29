import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("HABS Gliders © 2026")
            Text("Email: kayanshahproductions@icloud.com")
            Spacer()
            Text("Credit: VEX Robotics for the game field photo")
            Spacer()
        }
        .padding()
        .foregroundColor(.black)
        .background(Color.white)
    }
}
