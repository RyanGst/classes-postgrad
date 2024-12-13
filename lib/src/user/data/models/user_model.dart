import 'package:json_annotation/json_annotation.dart';

import '../../../team/data/models/ems_agency_model.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String username;
  final List<EmsAgencyModel> emsAgencyMemberships;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserModel({
    required this.id,
    required this.username,
    required this.emsAgencyMemberships,
  });

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      username: username,
      teams: emsAgencyMemberships.map((agency) => agency.toTeam()).toList(),
    );
  }
}
