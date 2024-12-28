class User {
  final String _id, _name;

  User({required String id, required String name})
      : _id = id,
        _name = name;

  String get id => _id;
  String get name => _name;

  @override
  String toString() => '{id: $_id, name: $_name}';
}
