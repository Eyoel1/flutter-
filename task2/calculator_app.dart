// Task 2: Async Calculator App
// Name: Addis Ababa University Student (Placeholder)

import 'dart:async';

/// Custom exception for unknown operations (Bonus Challenge).
class UnknownOperationException implements Exception {
  final String message;
  UnknownOperationException(this.message);
  @override
  String toString() => 'UnknownOperationException: $message';
}

class Calculator {
  final String name;
  final List<String> history = []; // Bonus Challenge: History Log

  Calculator(this.name);

  double add(double a, double b) => a + b;

  double subtract(double a, double b) => a - b;

  double multiply(double a, double b) => a * b;

  /// Throws ArgumentError if divisor is zero.
  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero.');
    }
    return a / b;
  }

  /// Simulates a network delay and performs the calculation.
  /// Bonus Challenge: Input validation with custom exception.
  Future<double> computeAsync(double a, double b, String op) async {
    double result;
    switch (op) {
      case 'add':
        result = add(a, b);
        break;
      case 'subtract':
        result = subtract(a, b);
        break;
      case 'multiply':
        result = multiply(a, b);
        break;
      case 'divide':
        result = divide(a, b);
        break;
      default:
        throw UnknownOperationException('Unknown operation: $op');
    }
    
    // Simulate delay
    const delay = Duration(seconds: 1, milliseconds: 500);
    await Future.delayed(delay);
    
    // Add to history
    history.add('$op($a, $b) = $result');
    return result;
  }

  /// Displays the result of an async calculation.
  /// Handles exceptions gracefully using try-catch.
  Future<void> displayResult(double a, double b, String op) async {
    try {
      final result = await computeAsync(a, b, op);
      print('$op($a, $b) = $result');
    } catch (e) {
      print('Error: $e');
    }
  }

  /// Bonus Challenge: Chains an operation across a list of values sequentially.
  Future<double> computeChained(List<double> values, String op) async {
    if (values.isEmpty) return 0.0;
    double total = values[0];
    for (int i = 1; i < values.length; i++) {
      total = await computeAsync(total, values[i], op);
    }
    return total;
  }

  /// Bonus Challenge: Prints the calculation history.
  void printHistory() {
    print('\n--- Calculation History ---');
    if (history.isEmpty) {
      print('No calculations performed.');
    } else {
      for (var record in history) {
        print(record);
      }
    }
    print('--------------------------\n');
  }
}

Future<void> main() async {
  final calc = Calculator('MyCalculator');
  print('--- ${calc.name} Starting ---');

  // Single operations (Sequential)
  print('\nRunning Sequential Operations...');
  await calc.displayResult(10, 4, 'add');
  await calc.displayResult(10, 4, 'subtract');
  await calc.displayResult(10, 4, 'multiply');
  await calc.displayResult(10, 4, 'divide');
  await calc.displayResult(10, 0, 'divide'); // Testing Error Handling
  await calc.displayResult(5, 5, 'modulo'); // Testing Custom Exception

  // Bonus Challenge: Parallel Operations
  print('\nRunning Parallel Operations using Future.wait()...');
  final stopwatch = Stopwatch()..start();
  await Future.wait([
    calc.displayResult(20, 5, 'add'),
    calc.displayResult(20, 5, 'subtract'),
    calc.displayResult(20, 5, 'multiply'),
  ]);
  stopwatch.stop();
  print('Parallel execution took: ${stopwatch.elapsed.inMilliseconds}ms');
  print('(Note: Parallel is faster because we await multiple delays simultaneously)');

  // Bonus Challenge: Chained Operations
  print('\nRunning Chained Addition for [1, 2, 3, 4]...');
  final chainedResult = await calc.computeChained([1, 2, 3, 4], 'add');
  print('Chained Result (sum): $chainedResult');

  // Bonus Challenge: Print History
  calc.printHistory();

  print('All calculations complete.');
}

/*
CONCEPTUAL QUESTIONS

Q6. What is the difference between a synchronous function and an asynchronous function in Dart? In your Calculator class, why is divide() synchronous while computeAsync() is asynchronous?
Answer: A synchronous function blockingly executes its code and returns immediately. An asynchronous function returns a Future, allowing other code to run while it waits for a long task. divide() is synchronous because basic arithmetic is nearly instantaneous; computeAsync() is asynchronous because it simulates a time-consuming network request using Future.delayed().

Q7. Explain the purpose of the await keyword in Dart. What happens if you forget to use await when calling an async function that returns a Future? What does your program print instead of the result?
Answer: The await keyword pauses the execution of an async function until the Future completes. If you forget await, the function continues immediately, and you get an instance of "Instance of 'Future<double>'" instead of the actual data.

Q8. What is the purpose of the try-catch block in your displayResult() method? What would happen if you removed it and then called displayResult(10, 0, 'divide')?
Answer: The try-catch block captures exceptions (like ArgumentError from divide-by-zero) so the program doesn't crash. If removed, the unhandled exception would bubble up and terminate the application abruptly, preventing subsequent code (like "All calculations complete") from running.

Q9. Why is it good design to have divide() throw an ArgumentError rather than simply returning 0 or printing an error inside the divide() method itself? What principle of function design does this reflect?
Answer: Throwing an error forces the caller to handle invalid input, whereas returning 0 might be interpreted as a valid result (masking the problem). This reflects the principle of "Fail Fast" and "Separation of Concerns" — a function should do one thing well (calculate) and let the caller decide how to handle failures.

Q10. What does the async keyword on main() allow you to do? Could this assignment have been written without making main() async? Explain your answer.
Answer: The async keyword on main() allows it to use the await keyword inside its body. Without it, we couldn't properly sequence the asynchronous calls in a clean way. While it's possible to use .then() callbacks, it makes the code much harder to read (callback hell).
*/
