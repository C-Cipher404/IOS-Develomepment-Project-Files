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
        Form {
            Section("Times Tables") {
                Picker("Times Table", selection: $selectedTable) {
                    ForEach(2...12, id: \.self) { number in
                        Text("\(number) times table")
                    }
                }
            }

            Section("Number of Questions") {
                Picker("Questions", selection: $questionCount) {
                    Text("5").tag(5)
                    Text("10").tag(10)
                    Text("20").tag(20)
                }
                .pickerStyle(.segmented)
            }

            Button("Start Game") {
                startGame()
            }
        }
        .navigationTitle("Multiplication Tables")
    }

    var gameView: some View {
        VStack(spacing: 30) {
            Text("Question \(currentQuestion + 1) of \(questions.count)")
                .font(.headline)

            Text(
                "\(questions[currentQuestion].firstNumber) × \(questions[currentQuestion].secondNumber)"
            )
            .font(.system(size: 48))
            .bold()

            TextField("Enter answer", text: $answerText)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            Button("Submit Answer") {
                checkAnswer()
            }
            .buttonStyle(.borderedProminent)

            Text("Score: \(score)")
                .font(.headline)

            Button("Back to Settings") {
                gameStarted = false
                gameFinished = false
                answerText = ""
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Practice")
    }

    var resultsView: some View {
        VStack(spacing: 25) {
            Text("Game Over")
                .font(.largeTitle)
                .bold()

            Text("Your Score")
                .font(.title2)

            Text("\(score) / \(questions.count)")
                .font(.system(size: 50))
                .bold()

            Button("Play Again") {
                gameStarted = false
                gameFinished = false
                answerText = ""
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationTitle("Results")
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
