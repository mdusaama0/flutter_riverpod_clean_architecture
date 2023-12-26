import 'package:hey_flutter_task/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.email, required super.name, required super.profile});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      profile: map['profile_pic'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'profile_pic': profile,
    };
  }
}
