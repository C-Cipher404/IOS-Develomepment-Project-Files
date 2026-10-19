print("Weekend Budget")

budget = 200
print(f"Budget: ${budget}")

expenses = [
    {"name": "Groceries", "amount": 65},
    {"name": "Gas", "amount": 40},
    {"name": "Pizza", "amount": 24},
    {"name": "Movies", "amount": 30}
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
