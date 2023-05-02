import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserService {
   Future<User?> register(String name, String cpf,String email, String password);
  Future<User?> login(String email, String password);
}
