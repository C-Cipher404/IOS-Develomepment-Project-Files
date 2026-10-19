def describe(temperature):
    if temperature < 0:
        return "Freezing"
    elif 0 <= temperature < 32:
        return "Cold"
    elif 32 <= temperature < 50:
        return "Cool"
    elif 50 <= temperature < 70:
        return "Warm"
    else:
        return "Hot"
temperatures = [90, 72, 40]
for temp in temperatures:
    description = describe(temp)
    print(f"The temperature is {temp} degrees, which is considered {description}.")