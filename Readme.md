# Dart Program Project

## Create Library System
Create a simple library system that manages borrowed and returned books.
- Title: Library system
- Description: Create a simple library system that manages borrowed and returned books.

#### Requirements 
  - User Class has attributes (id, name)  and print method
   - Books Class has attributes (id, title, borrowed) and print method
  
 - Library Class has attributes (list of books , list of users) , 
    and methods (addBook , return book , borrowBook ,
    print).
 - Add books, and users and perform some operations then 
     display the final state.



===============================================================================
### Draft Book Class
- define needed `private` variables {id : string, title : string, borrowed : bool}.

- define `parameterized` constructor with {id, title}.

- define `get` methods to get private variables values.

- define `borrow` method to change the current book state to be borrowed.

- Define `free` method to change the current book state to available.

- `override` toString() method to print {_id, _title, _borrowed}.

===============================================================================
### Draft User Class

- define needed `private` variables {id : string, name : string}.

- define `parameterized` constructor with {id, name}.

- define `get` methods to get private variables values.

- `override` toString() method to print {_id, _name}.


===============================================================================
### Draft Library Class

- declare `private` variables {users : List<User>, books : List<Books>,borrowedBooks : List<Map<String, dynamic>>}.

- define `get` methods to get private variables values.

- Define `addUser` method to add new user data to library system.

- Define `addBook` method to add new book data to library system.

- Define `getBookById` method to check is bookId is valid and exist.

- Define `getUserById` method to check is userId is valid and exist.

- Define `returnBook` method to change book state to be available and delete record from borrowedBooks list.

- Define `_isBookAvailable` method to check book availability.

- Define `_canUserBorrow` method to check if user currently borrowed any book or available to borrow.

- Define `borrowBook` method to allow user to borrow new book after many conditions:
  - `call` {getBookById} if false {return error book msg}

  - `call` {_isBookAvailable} if false {return error book borrowed msg}
  
  - `call` {_canUserBorrow} if false {return error user already borrowed msg}

  - `else` add the operation to borrowed-books list with values {"book": book, "user": user}.