//
//  SingleResponseSubview.swift
//  Course 2 Assessment Personality Quiz Project
//
//  Created by Cortney Anderson on 9/30/26.
//

import SwiftUI

struct SingleResponseSubview: View {

    let question: Question
    let questionIndex: Int

    @Binding var selectedAnswers: [Int: [Answer]]

    @State private var selectedIndex = 0
    @State private var answerSaved = false

    var body: some View {

        VStack(spacing: 22) {

            Text("Choose one answer:")
                .font(.headline)
                .foregroundStyle(.white.opacity(0.75))

            Picker(
                "Choose an answer",
                selection: $selectedIndex
            ) {

                ForEach(
                    question.answers.indices,
                    id: \.self
                ) { index in

                    Text(question.answers[index].text)
                        .tag(index)
                }
            }
            .pickerStyle(.menu)
            .tint(.white)

            Text(question.answers[selectedIndex].text)
                .font(.title3)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    Color.white.opacity(0.08)
                )
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 16
                    )
                )

            Button {

                selectedAnswers[questionIndex] = [
                    question.answers[selectedIndex]
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

                selectedIndex = savedIndex
                answerSaved = true
            }
        }
    }
}
