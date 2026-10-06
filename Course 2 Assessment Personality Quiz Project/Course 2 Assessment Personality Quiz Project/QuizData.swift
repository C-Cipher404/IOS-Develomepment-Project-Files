//
//  QuizData.swift
//  Course 2 Assessment: Personality Quiz Project
//
//  Created by Cortney Anderson on 9/30/26.
//

import SwiftUI

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer: Hashable {
    var text: String
    var type: HalloweenActivity
}

enum HalloweenActivity: CaseIterable, Hashable {
    case trickOrTreating
    case pumpkinPatch
    case scaryMovieMarathon
    case hauntedHouse

    var description: String {
        switch self {

        case .trickOrTreating:
            return "You are Trick-or-Treating! You are playful, social, and love the fun and nostalgic side of Halloween."

        case .pumpkinPatch:
            return "You are a Pumpkin Patch! You love cozy fall vibes, cute decorations, crisp weather, and relaxed Halloween fun."

        case .scaryMovieMarathon:
            return "You are a Scary Movie Marathon! You love spooky entertainment, snacks, blankets, and a cozy night in."

        case .hauntedHouse:
            return "You are a Haunted House! You are adventurous, thrill-seeking, and love the adrenaline of being scared."
        }
    }

    var name: String {
        switch self {

        case .trickOrTreating:
            return "Trick-or-Treating"

        case .pumpkinPatch:
            return "Pumpkin Patch"

        case .scaryMovieMarathon:
            return "Scary Movie Marathon"

        case .hauntedHouse:
            return "Haunted House"
        }
    }
}

let questionList: [Question] = [

    Question(
        text: "Pick your ideal Friday night.",
        type: .single,
        answers: [
            Answer(
                text: "Going out and having fun with friends",
                type: .trickOrTreating
            ),
            Answer(
                text: "Walking around somewhere cute and cozy",
                type: .pumpkinPatch
            ),
            Answer(
                text: "Staying home under a blanket",
                type: .scaryMovieMarathon
            ),
            Answer(
                text: "Doing something that gets my adrenaline going",
                type: .hauntedHouse
            )
        ]
    ),

    Question(
        text: "What makes Halloween fun for you?",
        type: .multiple,
        answers: [
            Answer(
                text: "Candy and treats",
                type: .trickOrTreating
            ),
            Answer(
                text: "Fall decorations and cute pictures",
                type: .pumpkinPatch
            ),
            Answer(
                text: "Horror movies and snacks",
                type: .scaryMovieMarathon
            ),
            Answer(
                text: "Getting scared",
                type: .hauntedHouse
            )
        ]
    ),

    Question(
        text: "How much do you like being scared?",
        type: .ranged,
        answers: [
            Answer(
                text: "Not at all",
                type: .pumpkinPatch
            ),
            Answer(
                text: "A little",
                type: .trickOrTreating
            ),
            Answer(
                text: "I love it",
                type: .scaryMovieMarathon
            ),
            Answer(
                text: "Terrify me!",
                type: .hauntedHouse
            )
        ]
    ),

    Question(
        text: "Choose your Halloween snack.",
        type: .single,
        answers: [
            Answer(
                text: "A giant bag of candy",
                type: .trickOrTreating
            ),
            Answer(
                text: "Apple cider and a donut",
                type: .pumpkinPatch
            ),
            Answer(
                text: "Popcorn and movie snacks",
                type: .scaryMovieMarathon
            ),
            Answer(
                text: "Whatever I can eat between screams",
                type: .hauntedHouse
            )
        ]
    ),

    Question(
        text: "Choose your perfect Halloween outfit.",
        type: .single,
        answers: [
            Answer(
                text: "A full Halloween costume",
                type: .trickOrTreating
            ),
            Answer(
                text: "Cute sweater, boots, and flannel",
                type: .pumpkinPatch
            ),
            Answer(
                text: "Halloween pajamas and fuzzy socks",
                type: .scaryMovieMarathon
            ),
            Answer(
                text: "Black clothes so I can survive the haunted house",
                type: .hauntedHouse
            )
        ]
    ),

    Question(
        text: "What would you bring on Halloween night?",
        type: .multiple,
        answers: [
            Answer(
                text: "A huge candy bag",
                type: .trickOrTreating
            ),
            Answer(
                text: "My phone for cute fall pictures",
                type: .pumpkinPatch
            ),
            Answer(
                text: "Blankets and snacks",
                type: .scaryMovieMarathon
            ),
            Answer(
                text: "A friend I can grab when I get scared",
                type: .hauntedHouse
            )
        ]
    ),

    Question(
        text: "How adventurous are you on Halloween?",
        type: .ranged,
        answers: [
            Answer(
                text: "Keep it cozy",
                type: .pumpkinPatch
            ),
            Answer(
                text: "Pretty chill",
                type: .scaryMovieMarathon
            ),
            Answer(
                text: "Let's go out",
                type: .trickOrTreating
            ),
            Answer(
                text: "Bring on chaos",
                type: .hauntedHouse
            )
        ]
    ),

    Question(
        text: "Where would you rather spend Halloween night?",
        type: .single,
        answers: [
            Answer(
                text: "Walking around a neighborhood full of decorations",
                type: .trickOrTreating
            ),
            Answer(
                text: "A farm covered in pumpkins and lights",
                type: .pumpkinPatch
            ),
            Answer(
                text: "On my couch with the lights off",
                type: .scaryMovieMarathon
            ),
            Answer(
                text: "Inside the creepiest building possible",
                type: .hauntedHouse
            )
        ]
    )
]
