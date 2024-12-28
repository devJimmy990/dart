class Book {
  late bool _borrowed;
  final String _id, _title;

  Book({required String id, required String title})
      : _id = id,
        _title = title,
        _borrowed = false;

  String get id => _id;
  String get title => _title;
  bool get borrowed => _borrowed;

  Book borrow() {
    _borrowed = true;
    return this;
  }

  void free() => _borrowed = false;
  @override
  String toString() => '{id: $_id, title: $_title, borrowed: $_borrowed}';
}
