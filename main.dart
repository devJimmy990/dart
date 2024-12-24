import 'BankAccount.dart';

void main(List<String> args) {
  /**
   *  declare 2 objects of BankAccount {account1, account2}
   * account1 is initialized with parameterized constructor accountID: '001' and balance: 120
   * account2 is initialized with name constructor accountID: '002' and initialized balance: 0
   *  */
  BankAccount account1 = BankAccount(accountID: '001', balance: 120);
  BankAccount account2 = BankAccount.zeroBalance(accountID: '002');

// use custom generic function to perform some operations and print values {bank statement simulation}
  printAccountStatement(account1);
  printAccountStatement(account2);
}

void printAccountStatement(BankAccount account) {
  print(
      '------------------------ Account Statement for: ${account.id} -------------------------------------');
  print('|\t\t\t\t\t\t\t\t\t\t\t|');

/**   print account balance   */
  print(
      '| Current Balance: ${account.balance}${account.balance == 0.0 ? '\t' : ''}\t\t\t\t\t\t\t\t|');
  print('|\t\t\t\t\t\t\t\t\t\t\t|');

/**   start withdraw transaction*/
  double? withdraw = account.withdraw(100);
  print('| Withdraw Action With Amount 100\t\t\t\t\t\t\t|');

/** 
 * perform withdraw transaction with the current balance before any deposit transaction
 * check withdraw status with return value from withdraw method
 * if null {this means the balance - 100 < 0}
 * if has value {this means the balance - 100 >= 0} and the value is the new balance after withdrawing
 * */
  print(
      '|\t ${withdraw != null ? 'Successfully Withdraw Transaction, the New Balance is: $withdraw' : 'oops, Failed Withdraw Transaction=> inSufficient Balance'}\t\t\t|');
  print('|\t\t\t\t\t\t\t\t\t\t\t|');

/**   start deposit transaction and print the new balance */
  double deposit = account.deposit(1000);
  print('| Deposit Action With Amount 1000\t\t\t\t\t\t\t|');
  print(
      '| \t Successfully Deposit Transaction, the New Balance is: $deposit\t\t\t|');
  print('|\t\t\t\t\t\t\t\t\t\t\t|');

/**
 * perform deposit transaction and print the new balance after the deposit transaction
 * and print the new balance after the deposit transaction if withdraw transaction has value
 */
  double? withdraw2 = account.withdraw(750);
  print('| Withdraw Action With Amount 750\t\t\t\t\t\t\t|');
  print(
      '|\t ${withdraw2 != null ? 'Successfully Withdraw Transaction, the New Balance is: $withdraw2' : 'oops, Failed Withdraw Transaction=> inSufficient Balance'}\t\t\t|');
  print('|\t\t\t\t\t\t\t\t\t\t\t|');

/**   print account details using toString() the override */
  print('| Account Details: ${account.toString()}\t\t\t\t\t|');
  print('|\t\t\t\t\t\t\t\t\t\t\t|');
  print(
      '-----------------------------------------------------------------------------------------\n');
}
