import 'package:json_annotation/json_annotation.dart';

import '../../../truck/data/models/truck_model.dart';
import '../../domain/entities/team.dart';

part 'ems_agency_model.g.dart';

@JsonSerializable()
class EmsAgencyModel {
  final String id;
  final String name;
  final List<TruckModel>? trucks;

  factory EmsAgencyModel.fromJson(Map<String, dynamic> json) =>
      _$EmsAgencyModelFromJson(json);

  EmsAgencyModel({required this.id, required this.name, required this.trucks});

  Map<String, dynamic> toJson() => _$EmsAgencyModelToJson(this);

  Team toTeam() {
    return Team(
        id: id,
        name: name,
        trucks: trucks?.map((truck) => truck.toEntity()).toList() ?? []);
  }
}
