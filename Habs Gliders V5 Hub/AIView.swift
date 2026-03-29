import SwiftUI

struct AIView: View {
    let apiKey: String
    let trainingInstructions: String

    @State private var userPrompt = ""
    @State private var messages: [[String: String]] = []

    var body: some View {
        VStack {
            ScrollView {
                ForEach(messages.indices, id: \.self) { i in
                    let msg = messages[i]
                    HStack {
                        if msg["role"] == "user" {
                            Spacer()
                            Text(msg["content"] ?? "")
                                .padding(6)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(6)
                        } else {
                            Text(msg["content"] ?? "")
                                .padding(6)
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(6)
                            Spacer()
                        }
                    }
                    .padding(4)
                }
            }

            HStack {
                TextField("Enter prompt...", text: $userPrompt)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Send") { sendPrompt() }
                    .padding(.horizontal)
                    .background(VEXColors.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
    }

    func sendPrompt() {
        guard !userPrompt.isEmpty else { return }

        messages.append(["role": "user", "content": userPrompt])
        let url = URL(string: "https://api.openai.com/v1/responses")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let fullMessages = [["role": "system", "content": trainingInstructions]] + messages
        let body: [String: Any] = ["model": "gpt-5.2", "input": fullMessages]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let output = json["output"] as? [[String: Any]],
               let content = output.first?["content"] as? [[String: Any]],
               let text = content.first?["text"] as? String {
                DispatchQueue.main.async { messages.append(["role": "assistant", "content": text]) }
            }
        }.resume()
        userPrompt = ""
    }
}
