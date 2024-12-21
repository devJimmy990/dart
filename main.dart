void main(List<String> args) {
  //  List of int values
  List<int> list = [42, -2, 87, 15, 7, 23, 66, 34, 90, 10, 3];

  //Check values
  checkNumber(list);
}

void checkNumber(List<int> list) {
  for (int num in list) {
    // Check if number is even by operator %2
    switch (num % 2) {
      case 0: // if result 0, this mean number is even
        {
          printResult(num, true);
          break;
        }
      default: // the default case the number is odd
        {
          printResult(num, false);
          break;
        }
    }
  }
}

void printResult(int value, bool isEven) =>
    print('The number $value is ${isEven ? 'even' : 'odd'}');
