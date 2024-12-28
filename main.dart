import 'Book.dart';
import 'Library.dart';
import 'User.dart';

const users = ['Jimmy', 'Muhammed', 'Gamal'];
void main(List<String> args) {
  Library library = Library();

  for (int i = 1; i < 3; i++) {
    library.addBook(Book(id: "00$i", title: "Book $i"));
  }

  for (int i = 0; i <= 2; i++) {
    library.addUser(User(id: "00${i + 1}", name: users[i]));
  }

  printLibraryOperations(library);
  // final book = library.borrowBook(bookID: "001", userID: "001");
  // final book1 = library.borrowBook(bookID: "001", userID: "001");
  // final book2 = library.borrowBook(bookID: "002", userID: "001");
  // print(book);
  // print(book1);
  // print(book2);
}

void printLibraryOperations(Library library) {
  /** 
   * define variables
   * 2 book [0, 1].id
   * 2 users [0, 1].id
   * opt is alice name for library operation
   *  */
  final user_jimmy = library.users[0].id;
  final user_muhammed = library.users[1].id;
  final user_gamal = library.users[2].id;

  final book1 = library.books[0].id;
  final book2 = library.books[1].id;
  print(
      '-------------------------------- Welcome in our Library -------------------------------------------------');
  print('|\t\t\t\t\t\t\t\t\t\t\t\t\t|');

/**   print library details {books, users, books that has been booked} */
  print('| Library Details: \t\t\t\t\t\t\t\t\t\t\t|$library\t\t\t\t|');
  print('|\t\t\t\t\t\t\t\t\t\t\t\t\t|');

/**   make user-jimmy borrow book1*/
  final opt1 = library.borrowBook(bookID: book1, userID: user_jimmy);
  print(
      '| Jimmy Request to borrow book1 => ${opt1["data"] != null ? 'successfully operation' : 'failed operation'}\t\t\t\t\t\t|');
  print(
      '| \t${opt1["data"] != null ? 'Jimmy can`t borrow another book till return the current' : '${opt1["msg"]}'}\t\t\t\t\t\t|');
  print('|\t\t\t\t\t\t\t\t\t\t\t\t\t|');

/**   make user-muhammed borrow the book1 the borrowed by user-jimmy*/
  final opt2 = library.borrowBook(bookID: book1, userID: user_muhammed);
  print(
      '| Muhammed Request to borrow book1 => ${opt2["data"] != null ? 'successfully operation' : 'failed operation\t'}\t\t\t\t\t\t|');
  print(
      '| \t${opt2["data"] != null ? 'Muhammed can`t borrow another book till return the current' : '${opt2["msg"]}\t'}\t\t\t\t\t\t|');
  print('|\t\t\t\t\t\t\t\t\t\t\t\t\t|');

/**   make user-jimmy borrow book2, and he already still borrowed book1*/
  final opt3 = library.borrowBook(bookID: book2, userID: user_jimmy);
  print(
      '| Jimmy Request to borrow book2 => ${opt3["data"] != null ? 'successfully operation' : 'failed operation'}\t\t\t\t\t\t\t|');
  print(
      '| \t${opt3["data"] != null ? 'Jimmy can`t borrow another book till return the current' : '${opt3["msg"]}'}\t\t\t\t\t\t\t\t|');
  print('|\t\t\t\t\t\t\t\t\t\t\t\t\t|');

/**   make user-muhammed borrow the book1 the borrowed by user-jimmy*/
  final opt4 = library.borrowBook(bookID: book2, userID: user_muhammed);
  print(
      '| Muhammed Request to borrow book2 => ${opt4["data"] != null ? 'successfully operation' : 'failed operation\t'}\t\t\t\t\t\t|');
  print(
      '| \t${opt4["data"] != null ? 'Muhammed can`t borrow another book till return the current' : '${opt4["msg"]}\t\t'}\t\t\t\t\t|');
  print('|\t\t\t\t\t\t\t\t\t\t\t\t\t|');

  /**   make user-gamal borrow book1, and the book was borrowed by user-jimmy*/
  final opt5 = library.borrowBook(bookID: book1, userID: user_gamal);
  print(
      '| Gamal Request to borrow book1 => ${opt5["data"] != null ? 'successfully operation' : 'failed operation'}\t\t\t\t\t\t\t|');
  print(
      '| \t${opt5["data"] != null ? 'Gamal can`t borrow another book till return the current' : '${opt5["msg"]}\t'}\t\t\t\t\t\t|');
  print('|\t\t\t\t\t\t\t\t\t\t\t\t\t|');

/**   make user-jimmy return book1*/
  library.returnBook(bookID: book1);
  print('| Jimmy will return book1 => successfully operation\t\t\t\t\t\t\t|');
  print(
      '| \tBook 1 is free to be borrowed by any user, Jimmy is available to borrow another book\t\t|');
  print('|\t\t\t\t\t\t\t\t\t\t\t\t\t|');

  /**   make user-gamal borrow book1, and the book is free now*/
  final opt6 = library.borrowBook(bookID: book1, userID: user_gamal);
  print(
      '| Gamal Request to borrow book1 => ${opt6["data"] != null ? 'successfully operation' : 'failed operation'}\t\t\t\t\t\t|');
  print(
      '| \t${opt6["data"] != null ? 'Gamal can`t borrow another book till return the current' : '${opt6["msg"]}'}\t\t\t\t\t\t|');
  print('|\t\t\t\t\t\t\t\t\t\t\t\t\t|');

  /**   print library details {books, users, books that has been booked} */
  print('| Library Details: \t\t\t\t\t\t\t\t\t\t\t|$library|');
  print('|\t\t\t\t\t\t\t\t\t\t\t\t\t|');
  print(
      '---------------------------------------------------------------------------------------------------------\n');
}
