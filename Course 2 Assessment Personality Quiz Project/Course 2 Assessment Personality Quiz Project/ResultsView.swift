//
//  ResultsView.swift
//  Course 2 Assessment Personality Quiz Project
//
//  Created by Cortney Anderson on 9/30/26.
//

import SwiftUI

enum HalloweenQuizError: Error {
    case noAnswers
}

func calculateResult(
    answers: [Answer]
) throws -> HalloweenActivity {

    guard !answers.isEmpty else {
        throw HalloweenQuizError.noAnswers
    }

    var counts: [HalloweenActivity: Int] = [:]

    for activity in HalloweenActivity.allCases {
        counts[activity] = 0
    }

    for answer in answers {
        counts[answer.type, default: 0] += 1
    }

    var winningActivity = HalloweenActivity.allCases[0]
    var highestCount = 0

    for activity in HalloweenActivity.allCases {

        let count = counts[activity, default: 0]

        if count > highestCount {
            highestCount = count
            winningActivity = activity
        }
    }

    return winningActivity
}

struct ResultsView: View {

    let answers: [Answer]

    var resultActivity: HalloweenActivity? {
        try? calculateResult(
            answers: answers
        )
    }

    func answerCount(
        for activity: HalloweenActivity
    ) -> Int {

        answers.filter {
            $0.type == activity
        }
        .count
    }

    var body: some View {

        ZStack {

            Color(
                red: 0.12,
                green: 0.12,
                blue: 0.14
            )
            .ignoresSafeArea()

            VStack(spacing: 18) {

                Spacer()

                Text("🎃")
                    .font(.system(size: 72))

                Text("Your Result")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.orange)

                if let result = resultActivity {

                    Text(result.name)
                        .font(.title)
                        .bold()
                        .foregroundStyle(.purple)
                        .multilineTextAlignment(.center)

                    Text(result.description)
                        .font(.title3)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 28)

                } else {

                    Text("No Result Yet")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.purple)

                    Text(
                        "Go back and answer some questions, then save your answers before viewing your result."
                    )
                    .font(.title3)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 28)
                }

                Text("Score Breakdown")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(
                        .white.opacity(0.5)
                    )
                    .padding(.top, 6)

                List {

                    ForEach(
                        HalloweenActivity.allCases,
                        id: \.self
                    ) { activity in

                        HStack {

                            Text(activity.name)
                                .font(.caption)
                                .foregroundStyle(
                                    .white.opacity(0.75)
                                )

                            Spacer()

                            Text(
                                "\(answerCount(for: activity))"
                            )
                            .font(.caption)
                            .bold()
                            .foregroundStyle(.orange)
                        }

                        .listRowBackground(
                            Color.white.opacity(0.04)
                        )

                        .listRowSeparatorTint(
                            Color.white.opacity(0.08)
                        )
                    }
                }
                .frame(height: 150)
                .scrollContentBackground(.hidden)
                .listStyle(.plain)

                Spacer()
            }
            .padding(.horizontal)
        }

        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
    }
}
