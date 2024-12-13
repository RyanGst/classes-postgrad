import 'package:equatable/equatable.dart';

import '../../../truck/domain/entities/truck.dart';

class Team extends Equatable {
  final String id;
  final String name;
  final List<Truck> trucks;

  const Team({ required this.id, required this.name, required this.trucks,});

  @override
  List<Object?> get props => [id, name, trucks];
}
