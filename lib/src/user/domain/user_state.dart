import 'package:equatable/equatable.dart';

import '../../core/domain/resource.dart';
import 'entities/user_entity.dart';

class UserState extends Equatable {
  final Resource<UserEntity> userResource;

  const UserState({ required this.userResource });

  UserState.initial(): userResource = Uninitialized();

  UserState updateResource(Resource<UserEntity> userResource) {
    return UserState(userResource: userResource);
  }

  @override
  List<Object?> get props => [userResource];
}
