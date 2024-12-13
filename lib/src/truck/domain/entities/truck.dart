import 'package:equatable/equatable.dart';

class Truck extends Equatable {
  final String id;
  final String name;

  const Truck({ required this.id, required this.name, });

  @override
  List<Object?> get props => [id, name];
}
