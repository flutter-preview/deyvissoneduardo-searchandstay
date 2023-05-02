import 'package:searchandstay/repository/account/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;

  UserServiceImpl({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<User?> login(String email, String password) =>
      _userRepository.login(email, password);

  @override
  Future<User?> register(String name, String cpf, String email, String password) =>
      _userRepository.register(name, email, cpf, password);
}
