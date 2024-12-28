import 'Book.dart';
import 'User.dart';

class Library {
  late List<User> _users;
  late List<Book> _books;
  late List<Map<String, dynamic>> _borrowedBooks;

  Library()
      : _users = [],
        _books = [],
        _borrowedBooks = [];

  // getters
  List<User> get users => _users;
  List<Book> get books => _books;
  List<Map<String, dynamic>> get borrowedBooks => _borrowedBooks;

  // add user to the library
  void addUser(User user) => _users.add(user);

  // add book to the library
  void addBook(Book book) => _books.add(book);

  // borrow a book
  Map<String, dynamic> borrowBook(
      {required String bookID, required String userID}) {
    Book? book = getBookById(bookID);
    User? user = getUserById(userID);

    if (book == null) {
      return {
        "data": null,
        "msg": "Book with ID: $bookID does not exist in the library."
      };
    }

    if (user == null) {
      return {
        "data": null,
        "msg": "User with ID: $userID is not registered in the library."
      };
    }

    if (!_isBookAvailable(bookID)) {
      return {
        "data": null,
        "msg": "The book is already borrowed by another user."
      };
    }

    if (!_canUserBorrow(userID)) {
      return {"data": null, "msg": "User has already borrowed another book."};
    }

    _borrowedBooks.add({"book": book, "user": user});
    return {
      "data": {"book": book, "user": user},
      "msg": "Book borrowed successfully."
    };
  }

  // return book
  void returnBook({required String bookID}) {
    _borrowedBooks.removeWhere((entry) => entry['book'].id == bookID);
    Book book = _books.firstWhere((book) => book.id == bookID);
    book.free();
  }

  // check book availability
  bool _isBookAvailable(String bookID) {
    return !_borrowedBooks.any((entry) => entry['book'].id == bookID);
  }

  // check if user can borrow a book
  bool _canUserBorrow(String userID) {
    return !_borrowedBooks.any((entry) => entry['user'].id == userID);
  }

  // check book id existence
  Book? getBookById(String bookID) {
    Book book = _books.firstWhere(
      (book) => book.id == bookID,
      orElse: () => Book(id: "", title: ""),
    );
    return book.id == ""
        ? null
        : _books.firstWhere((book) => book.id == bookID);
  }

  // check user id existence
  User? getUserById(String userID) {
    User user = _users.firstWhere(
      (user) => user.id == userID,
      orElse: () => User(id: "", name: ""),
    );
    return user.id == ""
        ? null
        : _users.firstWhere((user) => user.id == userID);
  }

  @override
  String toString() {
    return "\n|\tUsers: $_users \t\t|\n|\tBooks: $_books\t|\n|\tBorrowedBooks: ${_borrowedBooks.isEmpty ? 'There is no books out of library' : _borrowedBooks.map((entry) => '{Book: ${entry['book'].title}, User: ${entry['user'].name}}').join('; ')}\t\t\t";
  }
}
