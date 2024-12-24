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
      '-------------------------------- Welcome: ${account.id} -------------------------------------------');
  print('|\t\t\t\t\t\t\t\t\t\t\t|');

/**   print account details using toString() the override */
  print('| Account Details: ${account.toString()}\t\t\t\t\t\t|');
  print('|\t\t\t\t\t\t\t\t\t\t\t|');

/**   start withdraw transaction with negative amount - before any deposit transaction*/
  handleWithdrawing(account, -100);
  print('|\t\t\t\t\t\t\t\t\t\t\t|');

/**   start withdraw transaction with valid amount - before any deposit transaction*/
  handleWithdrawing(account, 100);
  print('|\t\t\t\t\t\t\t\t\t\t\t|');

/**   start deposit transaction with negative amount*/
  handleDeposit(account, -1000);
  print('|\t\t\t\t\t\t\t\t\t\t\t|');

/**   start deposit transaction with valid amount*/
  handleDeposit(account, 750);
  print('|\t\t\t\t\t\t\t\t\t\t\t|');

/**   start withdraw transaction with valid amount - after deposit transaction*/
  handleWithdrawing(account, 750);

  print('|\t\t\t\t\t\t\t\t\t\t\t|');
  print(
      '-----------------------------------------------------------------------------------------\n');
}

void handleWithdrawing(BankAccount account, double amount) {
  double? withdraw = account.withdraw(amount);
  print('| Withdraw Action With Amount $amount\t\t\t\t\t\t\t|');

/** 
 * check withdraw status with return value from withdraw method:
 * if -1 {this means the balance - amount < 0}
 * if null {this means the amount that need to withdraw is invalid {negative amount}}
 * if has value {this means the balance - amount >= 0} and the value is the new balance after withdrawing
 * */
  switch (withdraw) {
    case null:
      {
        print(
            '| oops, Failed Withdraw Transaction => Invalid Amount, The Current Balance is: ${account.balance}\t|');
        break;
      }
    case -1:
      {
        print(
            '| oops, Failed Withdraw Transaction => inSufficient Balance, The Current Balance is: ${account.balance}|');
        break;
      }
    default:
      print(
          '| Successfully Withdraw Transaction, the New Balance is: $withdraw\t\t\t\t|');
  }
}

void handleDeposit(BankAccount account, double amount) {
  double? deposit = account.deposit(amount);
  print('| Deposit Action With Amount $amount\t\t\t\t\t\t\t|');
  switch (deposit) {
    case null:
      {
        print(
            '| oops, Failed Deposit Transaction => Invalid Amount, The Current Balance is: ${account.balance}\t|');
        break;
      }
    default:
      print(
          '| Successfully Deposit Transaction, the New Balance is: $deposit\t\t\t\t|');
  }
}
