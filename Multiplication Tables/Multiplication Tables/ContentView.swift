//
//  ContentView.swift
//  Multiplication Tables
//
//  Created by Cortney Anderson on 10/14/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTable = 2
    @State private var questionCount = 5
    @State private var questions: [MultiplicationQuestion] = []

    @State private var currentQuestion = 0
    @State private var score = 0
    @State private var answerText = ""

    @State private var gameStarted = false
    @State private var gameFinished = false

    let limeGreen = Color(
        red: 0.75,
        green: 1.0,
        blue: 0.15
    )

    var body: some View {
        NavigationStack {
            if gameFinished {
                resultsView
            } else if gameStarted {
                gameView
            } else {
                settingsView
            }
        }
    }

    var settingsView: some View {
        ZStack {
            LinearGradient(
                colors: [.pink, .teal],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 25) {
                Text("✖️ Multiplication Tables")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)

                Text("Choose your challenge!")
                    .font(.title3)
                    .foregroundStyle(.white)

                VStack(spacing: 20) {
                    Text("Which times table?")
                        .font(.headline)

                    Picker("Times Table", selection: $selectedTable) {
                        ForEach(2...12, id: \.self) { number in
                            Text("\(number) times table")
                        }
                    }
                    .pickerStyle(.menu)

                    Divider()

                    Text("How many questions?")
                        .font(.headline)

                    Picker("Questions", selection: $questionCount) {
                        Text("5").tag(5)
                        Text("10").tag(10)
                        Text("20").tag(20)
                    }
                    .pickerStyle(.segmented)
                }
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal)

                Button {
                    startGame()
                } label: {
                    Text("Start Game 40 ")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(limeGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding(.top)
        }
    }

    var gameView: some View {
        ZStack {
            LinearGradient(
                colors: [.pink, .teal],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 28) {
                Text("Question \(currentQuestion + 1) of \(questions.count)")
                    .font(.headline)
                    .foregroundStyle(.white)

                Text("Score: \(score) ⭐️")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)

                VStack(spacing: 22) {
                    Text(
                        "\(questions[currentQuestion].firstNumber) × \(questions[currentQuestion].secondNumber)"
                    )
                    .font(.system(size: 64))
                    .bold()

                    TextField("Your answer", text: $answerText)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                        .font(.title2)

                    Button {
                        checkAnswer()
                    } label: {
                        Text("Submit Answer ✅")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(limeGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                }
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .shadow(radius: 5)
                .padding(.horizontal)

                Button("Back to Settings") {
                    gameStarted = false
                    gameFinished = false
                    answerText = ""
                }
                .foregroundStyle(.white)

                Spacer()
            }
            .padding(.top)
        }
        .navigationTitle("Practice")
    }

    var resultsView: some View {
        ZStack {
            LinearGradient(
                colors: [.pink, .teal],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 25) {
                Text("🎉 Great Job!")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)

                Text("Your Score")
                    .font(.title2)
                    .foregroundStyle(.white)

                Text("\(score) / \(questions.count)")
                    .font(.system(size: 60))
                    .bold()
                    .foregroundStyle(.white)

                Button {
                    gameStarted = false
                    gameFinished = false
                    answerText = ""
                } label: {
                    Text("Play Again 🔄")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(limeGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }

    func startGame() {
        createQuestions()

        currentQuestion = 0
        score = 0
        answerText = ""

        gameFinished = false
        gameStarted = true
    }

    func createQuestions() {
        questions.removeAll()

        var possibleQuestions: [MultiplicationQuestion] = []

        for secondNumber in 1...12 {
            let question = MultiplicationQuestion(
                firstNumber: selectedTable,
                secondNumber: secondNumber
            )

            possibleQuestions.append(question)
        }

        possibleQuestions.shuffle()

        if questionCount <= possibleQuestions.count {
            questions = Array(possibleQuestions.prefix(questionCount))
        } else {
            questions = possibleQuestions

            while questions.count < questionCount {
                let randomQuestion = MultiplicationQuestion(
                    firstNumber: selectedTable,
                    secondNumber: Int.random(in: 1...12)
                )

                questions.append(randomQuestion)
            }

            questions.shuffle()
        }
    }

    func checkAnswer() {
        if let playerAnswer = Int(answerText) {
            if playerAnswer == questions[currentQuestion].answer {
                score += 1
            }
        }

        answerText = ""

        if currentQuestion < questions.count - 1 {
            currentQuestion += 1
        } else {
            gameFinished = true
        }
    }
}

#Preview {
    ContentView()
}
