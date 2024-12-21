void main(List<String> args) {
  List<int> list = [42, -120, -2, 87, 15, 7, 23, 66, 34, 90, 10, 3];
  print(getMin(list));//120
}

int getMin(List<int> list) {
  int min = list[0];

//Loop with normal control flow
  for (int i = 1; i < list.length; i++) {
    if (list[i] < min) {
      min = list[i];
    }
  }

/**
 * loop with anonymous function 
 * (reduce) => minimize the list with comparing 2 values (a, b) and if a < b return a else return b 
 * int min = list.reduce((a, b) => a < b? a : b);
 * 
 * (forEach) => loop over all values and check if num < min then assign num to min
 * list.forEach((num) => num < min ? min = num : null);
 * 
 * the difference between (forEach) and (reduce) is:
 * 1- (reduce) can break the loop, but (forEach) can`t.
 * 2- (reduce) has a return value, but (forEach) doesn't.
 * 3- (reduce) any change happens not affects the original list, but (forEach) affects the original list.
 */
  return min;
}
