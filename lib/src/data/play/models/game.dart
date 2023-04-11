import 'package:freezed_annotation/freezed_annotation.dart';

part 'game.freezed.dart';
part 'game.g.dart';

@freezed
class Game with _$Game {
  const factory Game({
    required String id,
    required String owner,
    required List<String> participants,
    GameResult? result,
    required GameStatus status,
  }) = _Game;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}

@freezed
class GameResult with _$GameResult {
  const factory GameResult({
    required String winnerId,
    String? score,
  }) = _GameResult;

  factory GameResult.fromJson(Map<String, dynamic> json) =>
      _$GameResultFromJson(json);
}

enum GameStatus {
  @JsonValue('LISTED')
  listed,
  @JsonValue('PENDING')
  pending,
  @JsonValue('CONFIRMED')
  confirmed,
  @JsonValue('IN_PROGRESS')
  inProgress,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('CANCELLED')
  cancelled;
}
