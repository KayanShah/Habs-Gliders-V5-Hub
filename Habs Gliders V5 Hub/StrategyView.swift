import SwiftUI

// MARK: - Codable CGPoint wrapper
struct CodablePoint: Codable, Identifiable {
    let id = UUID()
    var x: Double
    var y: Double
    
    init(_ point: CGPoint) {
        self.x = Double(point.x)
        self.y = Double(point.y)
    }
    
    var cgPoint: CGPoint { CGPoint(x: x, y: y) }
}

// MARK: - Codable Color wrapper
struct CodableColor: Codable {
    var red: Double
    var green: Double
    var blue: Double
    
    init(_ color: Color) {
        let uiColor = UIColor(color)
        var r: CGFloat=0, g: CGFloat=0, b: CGFloat=0, a: CGFloat=0
        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        self.red = Double(r)
        self.green = Double(g)
        self.blue = Double(b)
    }
    
    var swiftUIColor: Color {
        Color(red: red, green: green, blue: blue)
    }
}

// MARK: - Stroke and Diagram Models
struct Stroke: Identifiable, Codable {
    let id = UUID()
    var points: [CodablePoint]
    var color: CodableColor
    var lineWidth: CGFloat
}

struct Diagram: Identifiable, Codable {
    let id = UUID()
    var title: String
    var strokes: [Stroke]
    var teams: [String] // optional team info
}

// MARK: - StrategyView
struct StrategyView: View {
    
    @State private var strokes: [Stroke] = []
    @State private var currentPoints: [CGPoint] = []
    
    @State private var selectedColor: Color = VEXColors.red
    @State private var eraserMode: Bool = false
    @State private var lineWidth: CGFloat = 3
    
    @State private var diagramTitle: String = ""
    @State private var savedDiagrams: [Diagram] = []
    @State private var showSaved: Bool = false
    
    let penColors: [Color] = [VEXColors.red, VEXColors.blue, VEXColors.white, VEXColors.black]
    
    var body: some View {
        VStack(spacing: 10) {
            
            // Title field
            HStack {
                Text("Title:")
                    .foregroundColor(.gray)
                TextField("Enter diagram title", text: $diagramTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
            
            // Canvas
            GeometryReader { geo in
                ZStack {
                    Color.white.ignoresSafeArea()
                    
                    Image("VEX Push Back Teamwork Field")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    // Existing strokes
                    ForEach(strokes) { stroke in
                        Path { path in
                            if let first = stroke.points.first?.cgPoint {
                                path.move(to: first)
                                for p in stroke.points.dropFirst() {
                                    path.addLine(to: p.cgPoint)
                                }
                            }
                        }
                        .stroke(stroke.color.swiftUIColor, lineWidth: stroke.lineWidth)
                    }
                    
                    // Current drawing
                    Path { path in
                        if let first = currentPoints.first {
                            path.move(to: first)
                            for p in currentPoints.dropFirst() {
                                path.addLine(to: p)
                            }
                        }
                    }
                    .stroke(selectedColor, lineWidth: lineWidth)
                    .contentShape(Rectangle())
                    .gesture(
                        DragGesture(minimumDistance: 0.1)
                            .onChanged { value in
                                if eraserMode {
                                    erase(at: value.location)
                                } else {
                                    currentPoints.append(value.location)
                                }
                            }
                            .onEnded { _ in
                                if !eraserMode && !currentPoints.isEmpty {
                                    let stroke = Stroke(
                                        points: currentPoints.map { CodablePoint($0) },
                                        color: CodableColor(selectedColor),
                                        lineWidth: lineWidth
                                    )
                                    strokes.append(stroke)
                                    currentPoints = []
                                }
                            }
                    )
                }
            }
            
            // Bottom toolbar
            VStack(spacing: 6) {
                
                HStack(spacing: 10) {
                    ForEach(penColors, id: \.self) { color in
                        Circle()
                            .fill(color)
                            .frame(width: 30, height: 30)
                            .overlay(Circle().stroke(Color.black, lineWidth: (!eraserMode && selectedColor == color) ? 3 : 0))
                            .onTapGesture {
                                selectedColor = color
                                eraserMode = false
                            }
                    }
                    
                    Button(action: { eraserMode.toggle() }) {
                        Text("Eraser")
                            .padding(6)
                            .background(eraserMode ? Color.gray.opacity(0.5) : Color.gray.opacity(0.2))
                            .cornerRadius(6)
                            .foregroundColor(.black)
                    }
                }
                
                HStack(spacing: 10) {
                    Button("Clear All") { strokes = [] }
                        .padding(6)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(6)
                    
                    Button("Save") { saveDiagram() }
                        .padding(6)
                        .background(Color.green.opacity(0.7))
                        .cornerRadius(6)
                        .foregroundColor(.white)
                    
                    Button("Load") { showSaved.toggle() }
                        .padding(6)
                        .background(Color.blue.opacity(0.7))
                        .cornerRadius(6)
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom)
        }
        .sheet(isPresented: $showSaved) {
            SavedDiagramsView(savedDiagrams: $savedDiagrams, strokes: $strokes)
        }
    }
    
    // MARK: - Functions
    private func erase(at point: CGPoint) {
        strokes.removeAll { stroke in
            stroke.points.contains { p in
                hypot(p.x - Double(point.x), p.y - Double(point.y)) < lineWidth * 2
            }
        }
    }
    
    private func saveDiagram() {
        let title = diagramTitle.isEmpty ? "Untitled" : diagramTitle
        let diagram = Diagram(title: title, strokes: strokes, teams: [])
        savedDiagrams.append(diagram)
        strokes = []
        diagramTitle = ""
    }
}

// MARK: - SavedDiagramsView
struct SavedDiagramsView: View {
    @Binding var savedDiagrams: [Diagram]
    @Binding var strokes: [Stroke]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List(savedDiagrams) { diagram in
                Button(diagram.title) {
                    strokes = diagram.strokes
                    dismiss()
                }
            }
            .navigationTitle("Saved Diagrams")
            .toolbar { Button("Close") { dismiss() } }
        }
    }
}
