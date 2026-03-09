// Task 1: Number Analysis App
// Name: Eyoel Goshu

int findMax(List<int> numbers) {
  if (numbers.isEmpty) {
    print('Error: List is empty. Returning 0.');
    return 0;
  }
  int maxVal = numbers[0];
  for (int num in numbers) {
    if (num > maxVal) {
      maxVal = num;
    }
  }
  return maxVal;
}

int findMin(List<int> numbers) {
  if (numbers.isEmpty) {
    print('Error: List is empty. Returning 0.');
    return 0;
  }
  int minVal = numbers[0];
  for (int num in numbers) {
    if (num < minVal) {
      minVal = num;
    }
  }
  return minVal;
}

int calculateSum(List<int> numbers) {
  int sum = 0;
  for (int num in numbers) {
    sum += num;
  }
  return sum;
}

double calculateAverage(List<int> numbers) {
  if (numbers.isEmpty) return 0.0;
  return calculateSum(numbers) / numbers.length;
}
int countNegatives(List<int> numbers) {
  int count = 0;
  for (int num in numbers) {
    if (num < 0) {
      count++;
    }
  }
  return count;
}
List<int> bubbleSort(List<int> numbers) {
  List<int> sorted = List.from(numbers);
  int n = sorted.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (sorted[j] > sorted[j + 1]) {
        int temp = sorted[j];
        sorted[j] = sorted[j + 1];
        sorted[j + 1] = temp;
      }
    }
  }
  return sorted;
}

void main() {
  final numbers = <int>[34, -7, 89, 12, -45, 67, 3, 100, -2, 55];

  print('Number Analysis Results');
  print('========================');
  print('Numbers: $numbers');
  
  final max = findMax(numbers);
  final min = findMin(numbers);
  final sum = calculateSum(numbers);
  final avg = calculateAverage(numbers);
  final negativeCount = countNegatives(numbers);
  final sortedNumbers = bubbleSort(numbers);

  print('Maximum value : $max');
  print('Minimum value : $min');
  print('Sum           : $sum');
  print('Average       : $avg');
  print('Negative Count: $negativeCount');
  print('Sorted List   : $sortedNumbers');
}
/*Q1. What is the difference between a List<int> and a List<dynamic> in Dart? Why is it usually better to use a typed list like List<int>?

Answer:
A List<int> can only store integer values, while a List<dynamic> can store values of any type such as integers, strings, booleans, or objects. Using a typed list like List<int> is usually better because it helps prevent errors and makes the code safer. The compiler can check the types of values being added to the list, which reduces bugs and makes the code easier to understand and maintain.

Q2. In your findMax() function, why is it important to initialize your 'running maximum' variable to the first element of the list rather than to 0 or to a very small number? What could go wrong with the other approaches?

Answer:
It is important to initialize the running maximum to the first element of the list because it guarantees that the starting value actually exists in the list. If we set it to 0, the function could give the wrong result when all numbers in the list are negative, since 0 would incorrectly remain the maximum. Using a very small number can also be unreliable because we might not know how small the numbers in the list could be. Starting with the first element avoids these problems and ensures the comparison works correctly.

Q3. Your calculateAverage() function calls calculateSum() internally. What software design principle does this demonstrate, and why is reusing existing functions preferable to duplicating code?

Answer:
This demonstrates the principle of code reuse and modular programming. Instead of rewriting the same logic multiple times, the program uses an already existing function to perform the task. Reusing functions is better because it keeps the code cleaner, reduces repetition, and makes maintenance easier. If the logic needs to change later, we only have to update it in one place instead of several different parts of the code.

Q4. Describe in plain English what the for-in loop syntax does in Dart. How is it different from a traditional for loop with an index? When would you prefer one over the other?

Answer:
A for-in loop in Dart goes through each item in a collection one by one and lets you directly work with each element. Instead of using a number to access elements, it automatically gives you the value of each item in the list.

A traditional for loop uses an index (like i) to access elements by their position in the list. The for-in loop is usually preferred when you only need to read the values in a collection because it is simpler and easier to read. A traditional for loop is better when you need to know the position of elements or modify them using their index.

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
*/