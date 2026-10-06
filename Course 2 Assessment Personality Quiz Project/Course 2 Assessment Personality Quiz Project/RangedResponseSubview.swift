//
//  RangedResponseSubview.swift
//  Course 2 Assessment Personality Quiz Project
//
//  Created by Cortney Anderson on 9/30/26.
//

import SwiftUI

struct RangedResponseSubview: View {

    let question: Question
    let questionIndex: Int

    @Binding var selectedAnswers: [Int: [Answer]]

    @State private var sliderValue = 0.0
    @State private var answerSaved = false

    var selectedAnswerIndex: Int {
        Int(sliderValue)
    }

    var body: some View {

        VStack(spacing: 25) {

            Text(
                question.answers[
                    selectedAnswerIndex
                ].text
            )
            .font(.title3)
            .bold()
            .foregroundStyle(.white)

            Slider(
                value: $sliderValue,
                in: 0...3,
                step: 1
            )
            .tint(.purple)

            HStack {

                ForEach(
                    question.answers.indices,
                    id: \.self
                ) { index in

                    Text(
                        question.answers[index].text
                    )
                    .font(.caption)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                }
            }

            Button {

                selectedAnswers[questionIndex] = [
                    question.answers[
                        selectedAnswerIndex
                    ]
                ]

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
                        ? "Answer Saved!"
                        : "Save Answer"
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

            if let savedAnswer =
                selectedAnswers[questionIndex]?.first,

               let savedIndex =
                question.answers.firstIndex(
                    of: savedAnswer
                ) {

                sliderValue = Double(savedIndex)
                answerSaved = true
            }
        }
    }
}
