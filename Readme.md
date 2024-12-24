# OOP Module

## Create BankAccount Class
Create a BankAccount class to withdraw or deposit amount of money



### Requirement 1
- Title: Create BankAccount Class
- Description: 
    - Create a BankAccount class with two variables account and balance.

    - Make two Constructors {Named, Parameterized}.

    - Parameterized Constructor is require {account-id, account-balance}.

    - Named Constructor is require {account-id} and initializes {account-balance = 0}.

    - Define withdraw and deposit methods to interact with account-balance according to the current balance status.

    - Define print method to display account details {account-id, account-balance}.



===============================================================================
### Draft BankAccount Class
- create new class with name {BankAccount}.

- declare needed `private variables` {_id, _balance}. 

- define `parameterized` and `named` constructors.

- define `get` methods to get private variables values.

- define `deposit` method to get the current balance and add the new amount then return the new balance.

- Define `withdraw` method to get the current balance and deduct the needed amount if this operation has:
    - result < 0  {then return null}
    - result > 0  {then return the new balance after deduction}.

- `override` toString() method to print {_id, _balance}.

### Draft Main FUnction 
- declare account2 as bank-account object using `named-constructor` {id : 002}.

- declare account1 as bank-account object using `parameterized-constructor` {id : 001, balance: 120}.

- define custom function to get account as parameter, perform some transactions and print the outputs.
