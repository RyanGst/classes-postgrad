// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ems_agency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmsAgencyModel _$EmsAgencyModelFromJson(Map<String, dynamic> json) =>
    EmsAgencyModel(
      id: json['id'] as String,
      name: json['name'] as String,
      trucks: (json['trucks'] as List<dynamic>?)
          ?.map((e) => TruckModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EmsAgencyModelToJson(EmsAgencyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'trucks': instance.trucks,
    };
