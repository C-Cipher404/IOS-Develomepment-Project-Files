print("Weekend Budget")

budget = 200
print(f"Budget: ${budget}")

expenses = [
    {"name": "Groceries", "amount": 65, "category": "Food"},
    {"name": "Gas", "amount": 40, "category": "Travel"},
    {"name": "Pizza", "amount": 24, "category": "Food"},
    {"name": "Movies", "amount": 30, "category": "Fun"}
]

for expense in expenses:
    print(f"{expense['name']}: ${expense['amount']}")

def total_spent(expenses):
    total = 0
    for expense in expenses:
        total += expense["amount"]
    return total

spent = total_spent(expenses)

# NameError on line 21: 'spnt' is not defined
print(f"Spent: ${spent}")
print(f"Left: ${budget - spent}")

def budget_status(budget, spent):
    if spent < budget:
        return "Under budget"
    elif spent == budget:
        return "Right on budget"
    else:
        return "Over budget"

print(budget_status(budget, spent))
print(budget_status(200, 200))
print(budget_status(200, 250))

# I used ChatGPT to translate my Swift code into Python.
# Python uses def instead of func and None instead of nil.
# Python also uses dictionaries instead of the Expense struct.
# The output matched the three lines from my Swift Playground.
# biggest_expense uses the Python max() function, which is idiomatic.
# I kept this version because it is simpler than writing a loop.

def category_total(category, expenses):
    total = 0
    for expense in expenses:
        if expense["category"] == category:
            total += expense["amount"]
    return total


def biggest_expense(expenses):
    if not expenses:
        return None

    return max(expenses, key=lambda expense: expense["amount"])


trip_expenses = [
    {"name": "Groceries", "amount": 65, "category": "Food"},
    {"name": "Gas", "amount": 40, "category": "Travel"},
    {"name": "Pizza", "amount": 24, "category": "Food"},
    {"name": "Movie tickets", "amount": 30, "category": "Fun"}
]

print(f"Food: ${category_total('Food', trip_expenses)}")

biggest = biggest_expense(trip_expenses)
if biggest is not None:
    print(f"Biggest: {biggest['name']}, ${biggest['amount']}")

if biggest_expense([]) is None:
    print("No expenses yet")


    # My own expenses
print(f"My Food total: ${category_total('Food', expenses)}")

my_biggest = biggest_expense(expenses)
if my_biggest is not None:
    print(f"My biggest expense: {my_biggest['name']}, ${my_biggest['amount']}")

    