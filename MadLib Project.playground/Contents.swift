import UIKit

struct MadLibGenerator{
    var noun: String,
    adjective: String,
    place: String,
    verb: String,
    animal: String,
    adverb: String,
    exclamation: String
    
   //var hasVaildInput: Bool {
     //   self.hasVaildInput == true
       // print("You are good to go")
         //   self.hasVaildInput == false
           // print("You must use strings")
    
  
    static func randomStoryNumber() -> Int {
      var storyCount = Int.random(in: 1...3)
        return storyCount
    }
    
   
    func  generateMadLib() -> String{
        let paragraph = """
           Today was a very \(adjective) day at the \(noun). I woke up feeling sad and decided to visit \(place) with my best friend. While we were \(verb) near the fountain, a wild \(animal) appeared out of nowhere and \(adverb) ran across the path! We both shouted "\(exclamation)!" and laughed until our stomachs hurt.
           """
        let paragraph2 = """
            Yesterday, my family took a trip to the \(adjective) amusement park. I was so excited to ride the \(noun) that I started to \(verb) all the way to the entrance! My friend told me to watch out for the ants near the ticket booth because they like to \(adverb) steal popcorn. For lunch, we ate a giant, greasy \(animal) while watching a street performer juggle \(place). It was the most \(exclamation) day ever!
            """
        let paragraph3 = """
                        \(exclamation)!" screamed the captain as the ship pulled into the \(place). Standing right on the dock was a massive  \(animal) that began to \(adverb) chase the crew. I didn't know what to do, so I grabbed a shiny \(noun) and started to \(verb) as fast as I could. The local villagers thought the whole scene was absolutely \(adjective)!!" 
            """
        return paragraph3
        
     
    }
}

let madLibGenerator = MadLibGenerator(noun: "Ann", adjective: "shiny", place: "London", verb: "running", animal: "Panda", adverb: "quickly", exclamation: "WOW")
let madLib = madLibGenerator.generateMadLib()
print(madLib)

      



