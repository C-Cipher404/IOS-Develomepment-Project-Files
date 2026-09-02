import UIKit

struct MadLibGenerator{
    var noun: String,
        adjective: String,
        place: String,
        verb: String,
        animal: String,
        adverb: String,
        exclamation: String
    
    static let storyCount = 3
    
    static func randomStoryNumber() -> Int {
        return Int.random(in: 1...storyCount)
    }
    
    var storyNumber: Int = MadLibGenerator.randomStoryNumber()
    
    var hasVaildInput: Bool{
        return !noun.isEmpty
        && !adjective.isEmpty
        && !place.isEmpty
        && !verb.isEmpty
        && !animal.isEmpty
        && !adverb.isEmpty
        && !exclamation.isEmpty
    }
    
    var storyTitle: String{
        switch storyNumber{
        case 1:
            return "A day with my best friend"
        case 2:
            return "Chaos at the amusement park"
        default:
            return "Trouble at the docks"
        }
    }
    func generateMadLib() -> String{
        if !hasVaildInput{
            return "Invalid Input"
        }
        
        switch storyNumber{
        case 1:
            return """
           Today was a very \(adjective) day at the \(noun). I woke up feeling sad and decided to visit \(place) with my best friend. While we were \(verb) near the fountain, a wild \(animal) appeared out of nowhere and \(adverb) ran across the path! We both shouted "\(exclamation)!" and laughed until our stomachs hurt.
           """
        case 2:
            return """
            Yesterday, my family took a trip to the \(adjective) amusement park. I was so excited to ride the \(noun) that I started to \(verb) all the way to the entrance! My friend told me to watch out for the ants near the ticket booth because they like to \(adverb) steal popcorn. For lunch, we ate a giant, greasy \(animal) while watching a street performer juggle \(place). It was the most \(exclamation) day ever!
            """
        default:
            return """
                        \(exclamation)!" screamed the captain as the ship pulled into the \(place). Standing right on the dock was a massive  \(animal) that began to \(adverb) chase the crew. I didn't know what to do, so I grabbed a shiny \(noun) and started to \(verb) as fast as I could. The local villagers thought the whole scene was absolutely \(adjective)!!" 
            """
            
        }
    }
}

let madLib1 = MadLibGenerator(noun: "Ann", adjective: "shiny", place: "London", verb: "running", animal: "Panda", adverb: "quickly", exclamation: "WOW")
print(madLib1.storyTitle)
print(madLib1.generateMadLib())
let madLib2 = MadLibGenerator(noun: "Ann", adjective: "shiny", place: "London", verb: "running", animal: "Panda", adverb: "quickly", exclamation: "WOW")
print(madLib2.generateMadLib())

let madLib3 = MadLibGenerator(noun: "", adjective: "shiny", place: "London", verb: "running", animal: "Panda", adverb: "quickly", exclamation: "WOW")
print(madLib3.generateMadLib())

for _ in 1...3{
    let random = MadLibGenerator(noun: "taco", adjective: "slimy", place: "Tokyo", verb: "sprinting", animal: "walrus", adverb: "loudly", exclamation: "YIKES")
    print("---\(random.storyTitle)---")
    print(random.generateMadLib())
}
    
    let forced = MadLibGenerator(noun: "taco", adjective: "slimy", place: "Tokyo", verb: "sprinting", animal: "walrus", adverb: "loudly", exclamation: "YIKES", storyNumber: 2)
    print(forced.storyTitle)
    print(forced.generateMadLib())
    
    var reusable = MadLibGenerator(noun: "banjo", adjective: "crusty", place: "Boise", verb: "crawling", animal: "llama", adverb: "silently", exclamation: "GADZOOKS")
    print(reusable.storyTitle)

    
    



