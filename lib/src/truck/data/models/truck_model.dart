
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/truck.dart';

part 'truck_model.g.dart';

@JsonSerializable()
class TruckModel {
  final String id;
  final String name;

  factory TruckModel.fromJson(Map<String, dynamic> json) => _$TruckModelFromJson(json);

  TruckModel({required this.id, required this.name});

  Map<String, dynamic> toJson() => _$TruckModelToJson(this);

  Truck toEntity() {
    return Truck(id: id, name: name);
  }
}
