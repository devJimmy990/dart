void main() {
  // List of grocery items (each item is a map with name and price)
  List<Map<String, dynamic>> groceries = [
    {'name': 'Apples', 'price': 2.50},
    {'name': 'Bread', 'price': 1.75},
    {'name': 'Milk', 'price': 1.25},
  ];

  // Calculate total price
  double totalPrice = calcTotalPrice(groceries);

  // Calculate price after tax
  double totalWithTax = calcTotalAfterTaxes(totalPrice);

  // Print results
  printResults(totalPrice, totalWithTax);
}

double calcTotalPrice(List<Map<String, dynamic>> groceries) {
  double totalPrice = 0.0;
  for (var item in groceries) {
    totalPrice += item['price'];
  }
  return totalPrice;
}

double calcTotalAfterTaxes(double totalPrice) {
  const double taxRate = 0.10;
  return totalPrice + (totalPrice * taxRate);
}

void printResults(double totalPrice, double totalWithTax) {
  print('Total Price: \$${totalPrice.toStringAsFixed(2)}');
  print('Total Price after Tax: \$${totalWithTax.toStringAsFixed(2)}');
}
