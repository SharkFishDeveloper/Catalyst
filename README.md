
# 🌟 Catalyst - A Code Execution Engine 🌟

### Created by: **SharkFishDeveloper** (aka Shahzeb Akhtar) on *28/09/24*

---

## 🚀 Getting Started

To use **Catalyst**, follow these steps:

1. Clone this GitHub repository:
   ```bash
   git clone https://github.com/SharkFishDeveloper/Catalyst
   ```
2. Change into the directory:
   ```bash
   cd Catalyst
   ```
3. Run the following command:
   ```bash
   npm run production
   ```
   This command will:
   - 🐳 Install the Catalyst image from Docker Hub.
   - 🌐 Start the engine on `localhost:2000`.
    
---

### ⚙️ Configuration

There is only one main configurational file in `./server/index.js`. You can easily configure either the Docker image or the Catalyst engine within this file.

### 🛠️ Rate Limiting

By default, there is rate limiting set to **120 requests per minute**. If you wish to change this, simply modify the configuration in the `index.js` file.

### 🌐 Language Support

Catalyst engine supports the following **5 programming languages** by default:
- **C**
- **C++**
- **Java**
- **Python**
- **JavaScript**

If you understand the codebase, you can easily add support for more languages!

---

# 📚 How to Use Catalyst

To execute your code with the **Catalyst** engine, you need to provide **three inputs**: `language`, `code`, and `stdin`.

### Example Input 
-->  Send a POST request to the following endpoint:
**URL:** `http://localhost:2000/submit-code`

```json
{
  "language": "c",
  "code": "#include <stdio.h>\r\nint main() {    \r\n\r\n    int number1, number2, sum;\r\n    \r\n    printf(\"Enter two integers: \\");\r\n    scanf(\"%d %d\", &number1, &number2);\r\n\r\n    // calculate the sum\r\n    sum = number1 + number2;      \r\n    \r\n    printf(\"%d + %d = %d\", number1, number2, sum);\r\n    return 0;\r\n}\r\n",
  "stdin": "1\n100"
}
```

### Expected Output

Upon execution, the output will be returned in the following format, which includes `stdout`, `executionTime`, `stderr`, and `language`:

```json
{
    "stdout": "Enter two integers: 1 + 100 = 101",
    "executionTime": 1206,
    "stderr": "",
    "language": "c"
}
```

### Explanation of Output Fields

- **stdout**: The standard output of your program, displaying any printed messages or results.
- **executionTime**: The time taken (in milliseconds) for the code to execute.
- **stderr**: Any errors that occurred during execution (if applicable).
- **language**: The programming language in which the code was written.

Feel free to customize the inputs according to your needs and enjoy coding with **Catalyst**! 🎉

---
### ✨ Features

- **Multi-language support**: Easily execute code in various programming languages.
- **Customizable**: Adjust the code engine as per your requirements.
- **Simple configuration**: All configurations can be made in a single file.
- **Fast to set up**: Just clone the repo and get started. (You should have docker installed)

### 📚 Contributing

Feel free to contribute to the project! If you have any questions or suggestions, don’t hesitate to reach out to me. **Happy coding!** 🎉
