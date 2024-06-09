import 'user.dart';

/// ドメイン層
/// User テーブルに関するリポジトリ
abstract interface class UserRepository {
  /// 投稿情報追加
  Future<void> add({required User user});

  /// 投稿情報変更
  Future<void> update({required User user});

  /// 投稿情報削除
  Future<void> delete({required String userId});

  /// 投稿情報取得
  Future<User> fetch({required String userId});

  /// 全投稿情報取得
  Future<List<User>> fetchAll();
}
