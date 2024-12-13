import 'package:equatable/equatable.dart';

import '../../../team/domain/entities/team.dart';

class UserEntity extends Equatable {
  final String id;
  final String username;
  final List<Team> teams;

  const UserEntity(
      {required this.id, required this.username, required this.teams});

  @override
  List<Object?> get props => [id, username, teams];

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
        id: json['id'] as String,
        username: json['username'] as String,
        teams: json['teams'] as List<Team>);
  }

  Map<String, dynamic> toJson() {
    return {'username': username};
  }
}
