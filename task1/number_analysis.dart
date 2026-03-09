// Task 1: Number Analysis App
// Name: Addis Ababa University Student (Placeholder)

/// Returns the largest number in the list using a manual loop.
/// Handle empty list by returning 0 (as per challenge requirement).
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

/// Returns the smallest number in the list using a manual loop.
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

/// Returns the sum of all numbers using a loop and accumulator pattern.
int calculateSum(List<int> numbers) {
  int sum = 0;
  for (int num in numbers) {
    sum += num;
  }
  return sum;
}

/// Returns the average as a decimal.
/// Calls calculateSum() internally to avoid duplication.
double calculateAverage(List<int> numbers) {
  if (numbers.isEmpty) return 0.0;
  return calculateSum(numbers) / numbers.length;
}

/// Bonus Challenge: Returns how many numbers in the list are negative.
int countNegatives(List<int> numbers) {
  int count = 0;
  for (int num in numbers) {
    if (num < 0) {
      count++;
    }
  }
  return count;
}

/// Bonus Challenge: Returns a new sorted list (ascending order) using Bubble Sort.
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

/*
CONCEPTUAL QUESTIONS

Q1. What is the difference between a List<int> and a List<dynamic> in Dart? Why is it usually better to use a typed list like List<int>?
Answer: List<int> is a type-safe collection that only accepts integer values, whereas List<dynamic> can hold any type of object (strings, doubles, etc.) simultaneously. Using a typed list is better because it provides compile-time safety, catch errors earlier, enables better IDE autocompletion, and allows for performance optimizations.

Q2. In your findMax() function, why is it important to initialize your 'running maximum' variable to the first element of the list rather than to 0 or to a very small number? What could go wrong with the other approaches?
Answer: Initializing to the first element ensures that the candidate maximum is actually a value from the set being analyzed. If initialized to 0, and all numbers in the list were negative (e.g., [-5, -10, -20]), the function would incorrectly return 0 as the maximum. If initialized to a "very small number," you risk the list containing even smaller numbers, leading to errors.

Q3. Your calculateAverage() function calls calculateSum() internally. What software design principle does this demonstrate, and why is reusing existing functions preferable to duplicating code?
Answer: This demonstrates the DRY (Don't Repeat Yourself) principle. Reusing existing functions is preferable because it reduces code duplication, makes maintenance easier (as you only have to fix logic in one place), and ensures consistency across different parts of the application.

Q4. Describe in plain English what the for-in loop syntax does in Dart. How is it different from a traditional for loop with an index? When would you prefer one over the other?
Answer: A for-in loop automatically iterates through every element in a collection without needing to track an index. It is simpler and more readable than a traditional for-loop when you just need to access each item. A traditional for-loop is preferred when you need the index for logic (like comparing with the next element or modifying a specific position), or when you only need to iterate over a specific range.

Q5. If someone calls your findMax() function with an empty list, what happens? How could you modify the function to handle that case safely?
Answer: If called with an empty list without safeguards, accessing numbers[0] would throw a RangeError. To handle this safely, one should check if the list is empty at the start of the function and either throw a custom exception, return a null (if the return type is int?), or return a default value like 0 with an error message.
*/
