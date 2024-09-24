# Function to divide two numbers
def divide_numbers(num1, num2):
    if num2 == 0:
        return "Error: Division by zero is not allowed."
    return num1 / num2

# Example usage
number1 = float(input("Enter the first number: "))
number2 = float(input("Enter the second number: "))

# Perform the division and print the result
result = divide_numbers(number1, number2)
print(f"The result of dividing {number1} by {number2} is: {result}")

# Additional print statements
print("hello again")
print("not")
