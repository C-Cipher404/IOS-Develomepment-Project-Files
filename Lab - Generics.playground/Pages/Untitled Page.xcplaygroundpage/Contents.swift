//: [Previous](@previous)

import Foundation

struct Expense {
    let name: String
    let amount: Int
    let category: String
}

func categoryTotal(for category: String, in expenses: [Expense]) -> Int {
    var total = 0
    for expense in expenses {
        if expense.category == category {
            total += expense.amount
        }
    }
    return total
}

func biggestExpense(in expenses: [Expense]) -> Expense? {
    if expenses.isEmpty {
        return nil
    }

    var biggest = expenses[0]

    for expense in expenses {
        if expense.amount > biggest.amount {
            biggest = expense
        }
    }
    return biggest
}

let tripExpenses = [
    Expense(name: "Groceries", amount: 65, category: "Food"),
    Expense(name: "Gas", amount: 40, category: "Travel"),
    Expense(name: "Pizza", amount: 24, category: "Food"),
    Expense(name: "Movie tickets", amount: 30, category: "Fun")
]

print("Food: $\(categoryTotal(for: "Food", in: tripExpenses))")

if let biggest = biggestExpense(in: tripExpenses) {
    print("Biggest: \(biggest.name), $\(biggest.amount)")
}

if biggestExpense(in: []) == nil {
    print("No expenses yet")
}

//: [Next](@next)
