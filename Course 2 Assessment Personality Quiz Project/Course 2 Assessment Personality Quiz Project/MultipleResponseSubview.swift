//
//  MultipleResponseSubview.swift
//  Course 2 Assessment Personality Quiz Project
//
//  Created by Cortney Anderson on 9/30/26.
//

import SwiftUI

struct MultipleResponseSubview: View {

    let question: Question
    let questionIndex: Int

    @Binding var selectedAnswers: [Int: [Answer]]

    @State private var optionOne = false
    @State private var optionTwo = false
    @State private var optionThree = false
    @State private var optionFour = false

    @State private var answerSaved = false

    var body: some View {

        VStack(spacing: 20) {

            Text("Choose as many as you want:")
                .font(.headline)
                .foregroundStyle(.white.opacity(0.75))

            VStack(spacing: 18) {

                Toggle(
                    question.answers[0].text,
                    isOn: $optionOne
                )

                Toggle(
                    question.answers[1].text,
                    isOn: $optionTwo
                )

                Toggle(
                    question.answers[2].text,
                    isOn: $optionThree
                )

                Toggle(
                    question.answers[3].text,
                    isOn: $optionFour
                )
            }

            .font(.body)
            .foregroundStyle(.white)
            .tint(.purple)

            Button {

                var answersToSave: [Answer] = []

                if optionOne {
                    answersToSave.append(
                        question.answers[0]
                    )
                }

                if optionTwo {
                    answersToSave.append(
                        question.answers[1]
                    )
                }

                if optionThree {
                    answersToSave.append(
                        question.answers[2]
                    )
                }

                if optionFour {
                    answersToSave.append(
                        question.answers[3]
                    )
                }

                selectedAnswers[questionIndex] =
                    answersToSave

                answerSaved = true

            } label: {

                HStack(spacing: 10) {

                    Image(
                        systemName:
                            answerSaved
                            ? "checkmark.circle.fill"
                            : "square.and.arrow.down"
                    )

                    Text(
                        answerSaved
                        ? "Answers Saved!"
                        : "Save Answers"
                    )
                    .bold()
                }

                .font(.headline)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 18
                    )
                )
            }

            .disabled(
                !optionOne &&
                !optionTwo &&
                !optionThree &&
                !optionFour
            )

            .opacity(
                !optionOne &&
                !optionTwo &&
                !optionThree &&
                !optionFour
                ? 0.5
                : 1
            )
        }

        .padding(22)

        .background(
            Color(
                red: 0.19,
                green: 0.19,
                blue: 0.21
            )
        )

        .clipShape(
            RoundedRectangle(
                cornerRadius: 24
            )
        )

        .onAppear {

            guard let savedAnswers =
                selectedAnswers[questionIndex]
            else {
                return
            }

            optionOne =
                savedAnswers.contains(
                    question.answers[0]
                )

            optionTwo =
                savedAnswers.contains(
                    question.answers[1]
                )

            optionThree =
                savedAnswers.contains(
                    question.answers[2]
                )

            optionFour =
                savedAnswers.contains(
                    question.answers[3]
                )

            answerSaved = true
        }
    }
}
