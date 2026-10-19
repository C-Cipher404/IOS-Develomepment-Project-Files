temperature = 72
if temperature > 85:
    print("Its hot!")
else:
    print("Its not hot.")

names = ["Alice", "Bob", "Charlie"]
for name in names:
    print(f"Hello, {name}!")
    for number in range(1, 4):
        print(f"Number: {number}")

def letter_grade(score):
    if score >= 90:
        return "A"
    elif score >= 80:
        return "B"
    elif score >= 70:
        return "C"
    elif score >= 60:
        return "D"
    else:
        return "F"
print(letter_grade(85))
