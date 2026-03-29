import Foundation

// MARK: - Match and Competition Models
struct Match: Identifiable {
    let id = UUID()
    let number: Int        // 1–13 for Q matches
    let isPractice: Bool   // true for P1
    let redAlliance: [String]
    let blueAlliance: [String]
}

struct Competition: Identifiable {
    let id = UUID()
    let name: String
    let date: String
    let location: String
    let matches: [Match]
}

// MARK: - Example Data
struct CompetitionsData {
    
    static let worldChampionship2026 = Competition(
        name: "2026 VEX World Championships",
        date: "April 25-27, 2026",
        location: "St Louis, Missouri, USA",
        matches: [
            // Practice match at top
            Match(number: 1, isPractice: true, redAlliance: ["PR1", "PR2"], blueAlliance: ["PB1", "PB2"]),
            
            // Qualification matches
            Match(number: 1, isPractice: false, redAlliance: ["R1", "R2"], blueAlliance: ["B1", "B2"]),
            Match(number: 2, isPractice: false, redAlliance: ["R3", "R4"], blueAlliance: ["B3", "B4"]),
            Match(number: 3, isPractice: false, redAlliance: ["R5", "R6"], blueAlliance: ["B5", "B6"]),
            Match(number: 4, isPractice: false, redAlliance: ["R7", "R8"], blueAlliance: ["B7", "B8"]),
            Match(number: 5, isPractice: false, redAlliance: ["R9", "R10"], blueAlliance: ["B9", "B10"]),
            Match(number: 6, isPractice: false, redAlliance: ["R11", "R12"], blueAlliance: ["B11", "B12"]),
            Match(number: 7, isPractice: false, redAlliance: ["R13", "R14"], blueAlliance: ["B13", "B14"]),
            Match(number: 8, isPractice: false, redAlliance: ["R15", "R16"], blueAlliance: ["B15", "B16"]),
            Match(number: 9, isPractice: false, redAlliance: ["R17", "R18"], blueAlliance: ["B17", "B18"]),
            Match(number: 10, isPractice: false, redAlliance: ["R19", "R20"], blueAlliance: ["B19", "B20"]),
            Match(number: 11, isPractice: false, redAlliance: ["R21", "R22"], blueAlliance: ["B21", "B22"]),
            Match(number: 12, isPractice: false, redAlliance: ["R23", "R24"], blueAlliance: ["B23", "B24"]),
            Match(number: 13, isPractice: false, redAlliance: ["R25", "R26"], blueAlliance: ["B25", "B26"])
        ]
    )
    
    static let all: [Competition] = [worldChampionship2026]
}
