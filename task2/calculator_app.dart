// Task 2: Async Calculator App
// Name: Eyoel Goshu

import 'dart:async';

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

  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero.');
    }
    return a / b;
  }

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
    
    const delay = Duration(seconds: 1, milliseconds: 500);
    await Future.delayed(delay);
    
    // Add to history
    history.add('$op($a, $b) = $result');
    return result;
  }

  Future<void> displayResult(double a, double b, String op) async {
    try {
      final result = await computeAsync(a, b, op);
      print('$op($a, $b) = $result');
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<double> computeChained(List<double> values, String op) async {
    if (values.isEmpty) return 0.0;
    double total = values[0];
    for (int i = 1; i < values.length; i++) {
      total = await computeAsync(total, values[i], op);
    }
    return total;
  }

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

  print('\nRunning Sequential Operations...');
  await calc.displayResult(10, 4, 'add');
  await calc.displayResult(10, 4, 'subtract');
  await calc.displayResult(10, 4, 'multiply');
  await calc.displayResult(10, 4, 'divide');
  await calc.displayResult(10, 0, 'divide'); 
  await calc.displayResult(5, 5, 'modulo'); 

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

  print('\nRunning Chained Addition for [1, 2, 3, 4]...');
  final chainedResult = await calc.computeChained([1, 2, 3, 4], 'add');
  print('Chained Result (sum): $chainedResult');
calc.printHistory();

  print('All calculations complete.');
}
/*Q6. What is the difference between a synchronous function and an asynchronous function in Dart? In your Calculator class, why is divide() synchronous while computeAsync() is asynchronous?

Answer:
A synchronous function runs step by step and finishes before the program moves on. An asynchronous function can run in the background without stopping the rest of the program. In the Calculator class, divide() is synchronous because it performs a quick calculation, while computeAsync() is asynchronous because it may take time and returns a Future.

Q7. Explain the purpose of the await keyword in Dart. What happens if you forget to use await when calling an async function that returns a Future? What does your program print instead of the result?

Answer:
The await keyword tells the program to wait for an async function to finish and return its result. If you forget to use await, the program won’t wait and will return a Future object instead. So instead of printing the actual result, it will print something like Instance of 'Future'.

Q8. What is the purpose of the try-catch block in your displayResult() method? What would happen if you removed it and then called displayResult(10, 0, 'divide')?

Answer:
The try-catch block is used to catch errors and stop the program from crashing. If it was removed and you tried displayResult(10, 0, 'divide'), the program would throw an error for dividing by zero and could crash.

Q9. Why is it good design to have divide() throw an ArgumentError rather than simply returning 0 or printing an error inside the divide() method itself? What principle of function design does this reflect?

Answer:
Throwing an ArgumentError is better because it clearly shows that something went wrong. Returning 0 could give the wrong result and confuse the user. This follows the principle of clear error handling and keeping functions responsible only for their main task.

Q10. What does the async keyword on main() allow you to do? Could this assignment have been written without making main() async? Explain your answer.

Answer:
The async keyword allows main() to use await and work with asynchronous functions. Without async, you couldn’t use await inside main(). The assignment could still work without it, but the code would be less clear because you would have to handle the Future results differently.
2.7 Optional Advanced Extensions

History Log:
Add a List<String> in the Calculator class to store every calculation done. For example: "add(10,4) = 14". Create a printHistory() method that prints all previous calculations.

Chain Operations:
Create a method computeChained(List<double> values, String op) that applies the same operation to all numbers in the list one by one. For example, adding [1,2,3,4] should return 10. This method should be asynchronous.

Input Validation:
Check if the operation passed to computeAsync() is valid. If it is not recognized, throw a custom exception class that you create (for example InvalidOperationException).

Parallel Futures:
Use Future.wait() to run several calculations at the same time instead of waiting for each one separately. This makes the program faster because multiple tasks run in parallel. Add a short comment explaining this in the code.
*/