//
//  TitleView.swift
//  Course 2 Assessment Personality Quiz Project
//
//  Created by Cortney Anderson on 9/30/26.
//

import SwiftUI

struct TitleView: View {

    @State private var selectedAnswers: [Int: [Answer]] = [:]
    @State private var showingInstructions = false

    var body: some View {

        NavigationStack {

            ZStack {

                Color(
                    red: 0.12,
                    green: 0.12,
                    blue: 0.14
                )
                .ignoresSafeArea()

                VStack(spacing: 28) {

                    Spacer()

                    Text("🎃")
                        .font(.system(size: 90))

                    Text("What Halloween Night Activity Are You?")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Text(
                        "Find out which Halloween activity matches your personality!"
                    )
                    .font(.headline)
                    .foregroundStyle(
                        .white.opacity(0.75)
                    )
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                    NavigationLink {

                        QuestionFlowView(
                            questionIndex: 0,
                            selectedAnswers: $selectedAnswers
                        )

                    } label: {

                        Text("Begin Quiz")
                            .font(.title3)
                            .bold()
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
                    .padding(.horizontal, 40)

                    Spacer()
                }
            }

            .toolbar {

                ToolbarItem(
                    placement: .topBarTrailing
                ) {

                    Button {

                        showingInstructions = true

                    } label: {

                        Image(
                            systemName:
                                "questionmark.circle.fill"
                        )
                        .foregroundStyle(.orange)
                    }
                }
            }

            .sheet(
                isPresented: $showingInstructions
            ) {

                InstructionsView()
            }
        }

        .tint(.orange)
        .preferredColorScheme(.dark)
    }
}

struct InstructionsView: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {

        NavigationStack {

            ZStack {

                Color(
                    red: 0.12,
                    green: 0.12,
                    blue: 0.14
                )
                .ignoresSafeArea()

                VStack(spacing: 25) {

                    Text("🎃")
                        .font(.system(size: 70))

                    Text("How To Play")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)

                    Text("""
                    Answer each Halloween question based on what sounds most like you.

                    Some questions let you choose one answer, some let you choose multiple answers, and some use a slider.

                    Make sure you tap "Save Answer" before moving to the next question.

                    At the end, your answers will reveal which Halloween night activity matches you best!
                    """)
                    .font(.title3)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding()

                    Spacer()
                }
                .padding()
            }

            .toolbar {

                ToolbarItem(
                    placement: .topBarTrailing
                ) {

                    Button("Done") {
                        dismiss()
                    }
                    .foregroundStyle(.orange)
                }
            }
        }
    }
}

#Preview {
    TitleView()
}
