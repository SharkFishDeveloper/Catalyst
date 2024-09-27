const fs = require('fs');

// Read from standard input
process.stdin.on('data', (data) => {
    // Split the input data into an array
    const numbers = data.toString().trim().split(' ').map(Number);

    // Check if two numbers are provided
    if (numbers.length !== 2 || numbers.some(isNaN)) {
        console.log('Please provide exactly two valid numbers.');
        return;
    }

    // Calculate the sum
    const sum = numbers[0] + numbers[1];
    console.log(`The sum of ${numbers[0]} and ${numbers[1]} is ${sum}.`);
});

// Handle error events
process.stdin.on('error', (err) => {
    console.error('Error reading input:', err);
});
