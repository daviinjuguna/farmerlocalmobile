import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class Register extends UseCase<String, RegisterParams> {
  Register(this._repository);

  @override
  Future<Either<String, String>> call(RegisterParams p) {
    return _repository.register(
      name: p.name,
      email: p.email,
      password: p.password,
    );
  }

  final Repository _repository;
}

class RegisterParams {
  final String name;
  final String email;
  final String password;
  RegisterParams({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterParams &&
        other.name == name &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ password.hashCode;

  @override
  String toString() =>
      'RegisterParams(name: $name, email: $email, password: $password)';
}
