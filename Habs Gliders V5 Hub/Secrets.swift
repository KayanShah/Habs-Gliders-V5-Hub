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
