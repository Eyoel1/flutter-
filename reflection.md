Q1. What is the difference between a List<int> and a List<dynamic> in Dart? Why is it usually better to use a typed list like List<int>?

Answer:
A List<int> can only store integer values, while a List<dynamic> can store values of any type such as integers, strings, booleans, or objects. Using a typed list like List<int> is usually better because it helps prevent errors and makes the code safer. The compiler can check the types of values being added to the list, whichQ1. What is the difference between a List<int> and a List<dynamic> in Dart? Why is it usually better to use a typed list like List<int>?

Answer:
A List<int> can only store integer values, while a List<dynamic> can store values of any type such as integers, strings, booleans, or objects. Using a typed list like List<int> is usually better because it helps prevent errors and makes the code safer. The compiler can check the types of values being added to the list, which reduces bugs and makes the code easier to understand and maintain.

Q2. In your findMax() function, why is it important to initialize your 'running maximum' variable to the first element of the list rather than to 0 or to a very small number? What could go wrong with the other approaches?

Answer:
{{ ... }}
Input Validation:
Check if the operation passed to computeAsync() is valid. If it is not recognized, throw a custom exception class that you create (for example InvalidOperationException).

Parallel Futures:
Use Future.wait() to run several calculations at the same time instead of waiting for each one separately. This makes the program faster because multiple tasks run in parallel. Add a short comment explaining this in the code.
because it is simpler and easier to read. A traditional for loop is better when you need to know the position of elements or modify them using their index.

Q5. If someone calls your findMax() function with an empty list, what happens? How could you modify the function to handle that case safely?

Answer:
If the findMax() function is called with an empty list, the program may crash or throw an error because there is no first element to compare. To handle this safely, the function can first check if the list is empty. If it is empty, the function could print an error message or return a default value such as null or 0. This prevents the program from crashing and makes the function more reliable.

1.7 Optional Challenge Extensions

Empty List Guard:
Add a condition at the beginning of each function that checks if the list is empty. If it is empty, print a message like "The list is empty. Cannot perform the calculation." and return a safe default value such as 0 or null.

Count Negatives:
Create a function called countNegatives(List<int> numbers) that loops through the list and counts how many numbers are less than zero. The function should return that count and print it in the program output.

Sorted Output:
Write a function that returns a new list sorted in ascending order without using .sort(). You could implement a simple algorithm like bubble sort, where the program repeatedly compares neighboring elements and swaps them if they are in the wrong order until the list is sorted.

Collection Methods Comparison:
Rewrite the functions using Dart’s built-in collection methods like .fold(), .where(), or .reduce(). Keep both versions of the code and add comments explaining that built-in methods are usually shorter and more concise, while manual loops can sometimes be easier for beginners to understand.
Q6. What is the difference between a synchronous function and an asynchronous function in Dart? In your Calculator class, why is divide() synchronous while computeAsync() is asynchronous?

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
