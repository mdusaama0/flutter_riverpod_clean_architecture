import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String email;
  final String name;
  final String profile;

  const UserEntity(
      {required this.email, required this.name, required this.profile});

  @override
  List<Object?> get props => [email, name, profile];
}
