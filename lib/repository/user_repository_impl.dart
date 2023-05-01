import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:searchandstay/repository/user_repository.dart';
import 'package:searchandstay/routes/app_routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepositoryImpl implements UserRepository {
  final supabase = Supabase.instance.client;

  @override
  Future<User?> login(String email, String password) async {
    GetStorage session = GetStorage();
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final User? user = res.user;
    if (user != null) {
      Get.offAndToNamed(AppRoutes.HOMEPAGE);
      session.write('SESSION', res.session?.accessToken);
    }
    if (user == null) {
      Get.to(AppRoutes.ACCOUNTPAGE);
    }
    return user;
  }

  @override
  Future<User?> register(String name, String email, String password) async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {'username': name},
      );
      final User? user = res.user;
      return user;
    } on AuthException catch (e) {
      if (e.statusCode == '429') {
        debugPrint('confirme e-mail');
        throw Exception();
      }
    }
    return null;
  }
}
