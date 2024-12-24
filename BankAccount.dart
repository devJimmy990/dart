class BankAccount {
  final String _id;
  late double _balance;


  //parameterized constructor with accountID as a required parameter
  BankAccount({required String accountID, required double balance})
      : _id = accountID,
        _balance = balance;


  //name constructor with accountID { required parameter } and balance {initialized parameters}
  BankAccount.zeroBalance({required String accountID})
      : _id = accountID,
        _balance = 0;


  //getter for balance and accountID
  double get balance => _balance;
  String get id => _id;


  //method to increase account balance
  double deposit(double amount) => _balance += amount;


  // method to decrease account balance
  double? withdraw(double amount) =>
      _balance - amount < 0 ? null : _balance -= amount;


  @override //override toString() to print object directly
  String toString() => 'Account ID: $_id, Balance: $_balance';
}
