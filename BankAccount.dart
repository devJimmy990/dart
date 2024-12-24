class BankAccount {
  final String _id;
  late double _balance;

  //parameterized constructor with accountID as a required parameter
  BankAccount({required String accountID, required double balance})
      : _id = accountID,
        _balance = balance > 0 ? balance : 0;

  //name constructor with accountID { required parameter } and balance {initialized parameters}
  BankAccount.zeroBalance({required String accountID})
      : _id = accountID,
        _balance = 0;

  //getter for balance and accountID
  double get balance => _balance;
  String get id => _id;

  //method to increase account balance
  double? deposit(double amount) => amount > 0 ? _balance += amount : null;

  // method to decrease account balance
  double? withdraw(double amount) => amount < 0
      ? null
      : _balance - amount < 0
          ? -1
          : _balance -= amount;

  @override //override toString() to print object directly
  String toString() => 'ID: $_id, Balance: $_balance';
}
