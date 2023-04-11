import 'package:athlas/src/data/play/models/game.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_game.freezed.dart';
part 'create_game.g.dart';

@freezed
class CreateGameRequest with _$CreateGameRequest {
  const factory CreateGameRequest({
    required String owner,
    required List<String> participants,
  }) = _CreateGameRequest;

  factory CreateGameRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateGameRequestFromJson(json);
}

@freezed
class CreateGameResponse with _$CreateGameResponse {
  const factory CreateGameResponse({
    required Game createdGame,
  }) = _CreateGameResponse;

  factory CreateGameResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGameResponseFromJson(json);
}
