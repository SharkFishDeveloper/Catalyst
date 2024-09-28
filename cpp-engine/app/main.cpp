#include <iostream>

int main() {
    int num1, num2, sum;

    // Prompt user for input
    std::cout << "Enter two numbers separated by space: ";
    
    // Read the two numbers
    std::cin >> num1 >> num2;

    // Calculate the sum
    sum = num1 + num2;

    // Display the result
    std::cout << "The sum of " << num1 << " and " << num2 << " is: " << sum << std::endl;

    return 0;
}
