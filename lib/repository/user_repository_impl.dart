import 'package:flutter/widgets.dart';
import 'package:searchandstay/repository/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepositoryImpl implements UserRepository {
  final supabase = Supabase.instance.client;

  @override
  Future<User?> login(String email, String password) async {
    final result = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    debugPrint('${result.session}');
    debugPrint('${result.user}');
    return result.session?.user;
  }

  @override
  Future<User?> register(String name, String email, String password) async {
    final result = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {'username': name},
    );
    debugPrint('${result.session}');
    debugPrint('${result.user}');
    return result.session?.user;
  }
}
