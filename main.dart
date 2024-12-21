import 'dart:io';

void main() {
  late bool isPositive, isEven;

  // get user input
  num number = readUserInput();

  // Check if the number is positive or negative using custom function
  isPositive = isNumberPositive(number);

  // Check if the number is even or odd using custom function
  isEven = isNumberEven(number);

  // print result
  printResult(number, isPositive, isEven);
}

num readUserInput() {
  int trails = 0;
  num? number;
  do {
    print(trails > 0
        ? 'The number is not valid, Enter Valid number(+-): '
        : 'Enter number(+-): ');
    number = num.tryParse(stdin.readLineSync() ?? '');
    trails++;
  } while (number == null);
  return number;
}

/**
 * check is user input number is positive or not
 * can use built in function .isNegative to get the same result
 */
bool isNumberPositive(num number) => number > 0;

// check is user input number is even or not
bool isNumberEven(num number) => number % 2 == 0;

void printResult(num number, bool isPositive, bool isEven) =>
    print('Number: $number\n\rIs Positive: ${isPositive}\n\rIs Even: ${isEven}');
