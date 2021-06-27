import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/entities/user.dart';
import 'package:farmerlocalmobile/features/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class Login extends UseCase<User, LoginParams> {
  Login(this._repository);

  @override
  Future<Either<String, User>> call(LoginParams p) {
    return _repository.login(email: p.email, password: p.password);
  }

  final Repository _repository;
}

class LoginParams {
  final String email;
  final String password;
  LoginParams({
    required this.email,
    required this.password,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginParams &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;

  @override
  String toString() => 'LoginParams(email: $email, password: $password)';
}
