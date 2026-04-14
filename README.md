<div align="center">

<br/>

```
██╗  ██╗ █████╗ ██████╗ ███████╗     ██████╗ ██╗     ██╗██████╗ ███████╗██████╗ ███████╗
██║  ██║██╔══██╗██╔══██╗██╔════╝    ██╔════╝ ██║     ██║██╔══██╗██╔════╝██╔══██╗██╔════╝
███████║███████║██████╔╝███████╗    ██║  ███╗██║     ██║██║  ██║█████╗  ██████╔╝███████╗
██╔══██║██╔══██║██╔══██╗╚════██║    ██║   ██║██║     ██║██║  ██║██╔══╝  ██╔══██╗╚════██║
██║  ██║██║  ██║██████╔╝███████║    ╚██████╔╝███████╗██║██████╔╝███████╗██║  ██║███████║
╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝     ╚═════╝ ╚══════╝╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝
```

# Habs Gliders V5 Hub · 34071B

**Strategy, scouting, and competition companion app for Team 34071B**  
Built by [Kayan Shah](https://github.com/KayanShah), Team Leader · **HABS Gliders 34071B**

<br/>

[![VEX Worlds 2026](https://img.shields.io/badge/VEX%20Worlds-2026%20Missouri-4f8ef7?style=for-the-badge)](https://www.roboticseducation.org/vex-robotics-world-championship/)
[![Team](https://img.shields.io/badge/Team-34071B%20HABS%20Gliders-ffd700?style=for-the-badge)](https://habs-gliders-34071b.vercel.app)
[![Swift](https://img.shields.io/badge/Built%20with-Swift%20%2F%20SwiftUI-f05138?style=for-the-badge&logo=swift&logoColor=white)](https://developer.apple.com/swift/)
[![Platform](https://img.shields.io/badge/Platform-iOS%20%2F%20iPadOS-000000?style=for-the-badge&logo=apple&logoColor=white)](https://developer.apple.com/)

<br/>

![Divider](https://img.shields.io/badge/─────────────────────────────────────────────-transparent?style=flat-square)

</div>

---

## ✦ About

The **Habs Gliders V5 Hub** is a native iOS/iPadOS app built for Team 34071B — first deployed at the **2026 VEX Robotics World Championship in Missouri**. It serves as a centralised strategy, scouting, and match-day companion, purpose-built around the 2025/26 VEX V5 game **Push Back**.

No fluff. Just the tools the team actually needs, on-device and fast.

---

## ✦ Features

| | Feature |
|---|---|
| 🤖 | **AI Strategy Assistant** — powered by OpenAI, trained on Push Back rules and HABS Gliders playstyle |
| 🏆 | **Competitions Tracker** — match schedule, results, and standings at a glance |
| 🎨 | **Team Colour Scheme** — consistent HABS Gliders branding throughout |
| 📋 | **Strategy View** — structured match planning and autonomous strategy notes |
| ℹ️ | **Info Hub** — team info, game rules, and quick reference |
| 🌙 | **Dark-first design** — built for pit and field conditions |

---

## ✦ Tech Stack

```
Language     →  Swift / SwiftUI
AI           →  OpenAI API (GPT-4o) via Secrets.swift
Platform     →  iOS 17+ / iPadOS 17+
IDE          →  Xcode
Assets       →  Native .xcassets — custom branding + field images
Colour       →  VEXColors.swift — centralised team palette
```

---

## ✦ Project Structure

```
Habs Gliders V5 Hub/
├── Habs Gliders V5 Hub/
│   ├── AIView.swift                  ← AI strategy assistant
│   ├── CompetitionsView.swift        ← Match tracker
│   ├── CompetitionsData.swift        ← Competition data model
│   ├── ContentView.swift             ← Root navigation
│   ├── HomeView.swift                ← Dashboard
│   ├── InfoView.swift                ← Team + game info
│   ├── StrategyView.swift            ← Match strategy planner
│   ├── ColourScheme.swift            ← UI theming
│   ├── VEXColors.swift               ← Team colour palette
│   ├── Secrets.swift                 ← API key (gitignored)
│   ├── Habs_Gliders_V5_HubApp.swift  ← App entry point
│   └── Assets.xcassets/              ← Images + icons
├── Habs Gliders V5 Hub.xcodeproj/
└── .gitignore
```

---

## ✦ AI Assistant

The built-in AI assistant is trained specifically for Push Back and HABS Gliders:

```
You are a VEX robotics strategy assistant for Team 34071B Habs Gliders.
You must only answer for the 2025/26 VEX V5 Game Push Back.
Only use British English.
Provide tips, personalised suggestions, and strategy ideas based on user prompts.
```

The OpenAI API key is stored in `Secrets.swift`, which is excluded from version control via `.gitignore`.

---


## ✦ Setup

### 1. Fork the repo

Click the **Fork** button at the top right of this page to create your own copy of the repo under your GitHub account.

### 2. Clone your fork

```bash
git clone https://github.com/YOUR_USERNAME/Habs-Gliders-V5-Hub.git
```

### 3. Add your API key

Edit `Secrets.swift` in the `Habs Gliders V5 Hub/` folder with your correct details:

```swift
import Foundation

struct Secrets {
    // OpenAI API Key
    static let openAIKey = "" //Hidden for data protection reasons, add your openAI API key here
    
    // Training instructions / advice for AI
    static let trainingInstructions = """
    You are a VEX robotics strategy assistant for Team 34071B Habs Gliders. You must only answer for the 2025/26 VEX V5 Game Push Back.  
    Only use British English 
    Provide tips, personalized suggestions, and strategy ideas based on user prompts.
    """ // Hidden for competitions reasons- will be released after VEX Worlds 2026
}

```

### 4. Build and run

Open `Habs Gliders V5 Hub.xcodeproj` in Xcode, select your target device, and hit **Run**.


---

## ✦ License

This project is licensed under the **[Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/)** licence.

You are free to use, modify, and distribute this project provided that you:

- **Credit the author** — Kayan Shah
- **Link to the source** — [github.com/KayanShah](https://github.com/KayanShah)
- **Indicate if changes were made**

> © 2026 Kayan Shah · [github.com/KayanShah](https://github.com/KayanShah)

---

<div align="center">

<br/>

Made by **[Kayan Shah](https://github.com/KayanShah)**  
Team Leader · HABS Gliders · 34071B · United Kingdom

<br/>

*First deployed at the VEX Robotics World Championship 2026 · St. Louis, Missouri*

</div>
