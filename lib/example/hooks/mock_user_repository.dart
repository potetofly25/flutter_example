import 'user.dart';
import 'user_repository.dart';

class MockUserRepository implements UserRepository {
  var mockUsers = <User>[
    User(id: "001", userName: 'hoge'),
    User(id: "002", userName: 'hoge2'),
    User(id: "003", userName: 'hoge3'),
  ];

  @override
  Future<void> add({required User user}) async {
    await Future.delayed(const Duration(seconds: 2));
    mockUsers.add(user);
  }

  @override
  Future<List<User>> fetchAll() async {
    await Future.delayed(const Duration(seconds: 2));
    return mockUsers;
  }

  @override
  Future<void> delete({required String userId}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<User> fetch({required String userId}) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<void> update({required User user}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
