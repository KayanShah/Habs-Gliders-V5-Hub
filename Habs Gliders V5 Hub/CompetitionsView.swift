import SwiftUI

struct CompetitionsView: View {
    
    let competitions = CompetitionsData.all
    
    var body: some View {
        NavigationView {
            List(competitions) { competition in
                Section(header:
                            VStack(alignment: .leading) {
                                Text(competition.name)
                                    .font(.headline)
                                Text("Date: \(competition.date)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text("Location: \(competition.location)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical, 4)
                ) {
                    ForEach(competition.matches) { match in
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text(match.isPractice ? "P\(match.number)" : "Q\(match.number)")
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Red Alliance")
                                        .font(.subheadline)
                                        .foregroundColor(.red)
                                    Text(match.redAlliance.joined(separator: ", "))
                                }
                                Spacer()
                                VStack(alignment: .leading) {
                                    Text("Blue Alliance")
                                        .font(.subheadline)
                                        .foregroundColor(.blue)
                                    Text(match.blueAlliance.joined(separator: ", "))
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Competitions")
            .listStyle(InsetGroupedListStyle())
        }
    }
}
