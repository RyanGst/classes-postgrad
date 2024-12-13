import 'package:flutter_test/flutter_test.dart';
import 'package:riverpodexample/src/team/domain/entities/team.dart';
import 'package:riverpodexample/src/user/domain/entities/user_entity.dart';

void main() {
  group('UserEntity', () {
    final testTeam = Team(id: '1', name: 'Test Team', trucks: const []);
    final testUser = UserEntity(
      id: '123',
      username: 'testuser',
      teams: [testTeam],
    );

    test('fromJson creates correct UserEntity', () {
      final json = {
        'id': '123',
        'username': 'testuser',
        'teams': [testTeam],
      };

      final result = UserEntity.fromJson(json);

      expect(result.id, '123');
      expect(result.username, 'testuser');
      expect(result.teams, [testTeam]);
    });

    test('toJson returns correct map', () {
      final result = testUser.toJson();

      expect(result, {
        'username': 'testuser',
      });
    });

    test('props contains all fields', () {
      expect(testUser.props, [testUser.id, testUser.username, testUser.teams]);
    });
  });
}
