//
//  QuestionFlowView.swift
//  Course 2 Assessment: Personality Quiz Project
//
//  Created by Cortney Anderson on 9/30/26.
//

import SwiftUI

struct QuestionFlowView: View {

    let questionIndex: Int

    @Binding var selectedAnswers: [Int: [Answer]]

    var question: Question {
        questionList[questionIndex]
    }

    var questionEmoji: String {
        switch questionIndex {
        case 0:
            return "💀"
        case 1:
            return "🧙‍♀️"
        case 2:
            return "🐈‍⬛"
        case 3:
            return "🍬"
        case 4:
            return "🧹"
        case 5:
            return "🐸"
        case 6:
            return "👻"
        default:
            return "🏚️"
        }
    }

    var body: some View {

        ZStack {

            Color(
                red: 0.12,
                green: 0.12,
                blue: 0.14
            )
            .ignoresSafeArea()

            ScrollView {

                VStack(spacing: 24) {

                    Text(
                        "Question \(questionIndex + 1) of \(questionList.count)"
                    )
                    .font(.headline)
                    .foregroundStyle(.white.opacity(0.65))

                    Text(questionEmoji)
                        .font(.system(size: 70))

                    Text(question.text)
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 15)

                    Divider()
                        .background(
                            Color.white.opacity(0.25)
                        )

                    switch question.type {

                    case .single:

                        SingleResponseSubview(
                            question: question,
                            questionIndex: questionIndex,
                            selectedAnswers: $selectedAnswers
                        )

                    case .multiple:

                        MultipleResponseSubview(
                            question: question,
                            questionIndex: questionIndex,
                            selectedAnswers: $selectedAnswers
                        )

                    case .ranged:

                        RangedResponseSubview(
                            question: question,
                            questionIndex: questionIndex,
                            selectedAnswers: $selectedAnswers
                        )
                    }
                }
                .padding()
            }
        }

        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)

        .toolbar {

            ToolbarItem(
                placement: .topBarTrailing
            ) {

                if questionIndex < questionList.count - 1 {

                    NavigationLink {

                        QuestionFlowView(
                            questionIndex: questionIndex + 1,
                            selectedAnswers: $selectedAnswers
                        )

                    } label: {

                        Text("Next")
                            .bold()
                            .foregroundStyle(.orange)
                    }

                } else {

                    NavigationLink {

                        ResultsView(
                            answers:
                                selectedAnswers
                                    .values
                                    .flatMap { $0 }
                        )

                    } label: {

                        Text("Results")
                            .bold()
                            .foregroundStyle(.orange)
                    }
                }
            }
        }

        .preferredColorScheme(.dark)
    }
}
