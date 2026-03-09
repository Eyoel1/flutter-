# Reflection - Dart Fundamentals

## QR1. Which concept was hardest to understand: lists and loops, classes and methods, exception handling, or async/await?

The concept of **async/await** was initially the most challenging. While synchronous loops and lists follow a predictable linear order, asynchronous programming requires thinking about the timeline of execution and potential "pauses" where other code can run. Understanding that `await` doesn't "stop" the entire program but only pauses the current function was a key "aha" moment. I realized that the program can remain responsive even while waiting for a single long-running task to complete.

## QR2. Look at your Task 1 solution. If you had to change your code to analyze a list of floating-point numbers (List<double>) instead of integers, how many places in your code would need to change? What does this tell you about the importance of thinking about data types during design?

To change the list to `List<double>`, I would need to update the type annotations in the parameters of all four functions (`findMax`, `findMin`, `calculateSum`, `calculateAverage`), as well as the return types for the first three. This highlights the importance of **static typing** in Dart. While it requires explicitly defining types, it forces the developer to be deliberate about the data they handle, leading to more robust and predictable code. In a larger project, using generics (e.g., `<T extends num>`) would be a better way to handle multiple numeric types without duplicating code.

## QR3. In Task 2, you simulated a network delay using Future.delayed(). Describe a real Flutter app feature where you would need to actually await a real asynchronous operation — not just a simulated delay. What would the Future resolve to, and what would happen to the UI while the user was waiting?

A classic example is a **User Login** feature where the app sends credentials to a backend API. The `Future` would resolve to a `User` object or a boolean indicating success. While the user is waiting, the UI would typically display a `CircularProgressIndicator` to provide visual feedback. Without the `await` keyword, the app might try to navigate the user to the "Home" screen before the authentication was actually confirmed, resulting in errors or security issues.

## QR4. If a colleague asked you: 'Why not just use a single function that takes the operation name as a parameter, rather than writing separate add(), subtract(), multiply(), and divide() methods?' — what would you say? Are there advantages to both approaches?

The separate methods approach follows the principle of **Single Responsibility**. Each method has a clear, isolated purpose, making it easier to unit test and debug. For example, the `divide` method specifically handles the zero-division logic without cluttering other operations.

On the other hand, a single function (like `computeAsync`) is more flexible for dynamic inputs, such as when parsing commands from a user interface. The best approach is often a combination: granular synchronous methods for the core logic and a clean wrapper/interface for higher-level operations.
