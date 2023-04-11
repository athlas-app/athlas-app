import 'package:athlas/src/data/dio.dart';
import 'package:athlas/src/data/play/api/create_game/create_game.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'play_repository.g.dart';

@RestApi()
abstract class GameRepository {
  factory GameRepository(Dio dio, {String baseUrl}) = _GameRepository;

  @POST('/Play/CreateGame')
  Future<CreateGameResponse?> createGame();
}

final matchRepositoryProvider = Provider<GameRepository>((ref) {
  return GameRepository(ref.read(dioProvider));
});
