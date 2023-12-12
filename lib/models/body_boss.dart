import 'dart:convert';

import 'package:configuracion_loggin/models/bosses_response.dart';

class BodyBoss {
  String id;
  String name;
  String bossType;
  String bossTypeUrl;
  int start;
  int end;
  int totalScoresStandard;
  int totalScoresElite;
  ScoringTypeElement scoringType;
  String leaderboardStandardPlayers1;
  String leaderboardElitePlayers1;
  String metadataStandard;
  String metadataElite;
  bool isFavorite;

  BodyBoss({
    required this.id,
    required this.name,
    required this.bossType,
    required this.bossTypeUrl,
    required this.start,
    required this.end,
    required this.totalScoresStandard,
    required this.totalScoresElite,
    required this.scoringType,
    required this.leaderboardStandardPlayers1,
    required this.leaderboardElitePlayers1,
    required this.metadataStandard,
    required this.metadataElite,
    required this.isFavorite,
  });

  factory BodyBoss.fromRawJson(String str) =>
      BodyBoss.fromJson(json.decode(str));

  factory BodyBoss.fromJson(Map<String, dynamic> json) => BodyBoss(
        id: json["id"],
        name: json["name"],
        bossType: json["bossType"],
        bossTypeUrl: json["bossTypeURL"],
        start: json["start"],
        end: json["end"],
        totalScoresStandard: json["totalScores_standard"],
        totalScoresElite: json["totalScores_elite"],
        scoringType: scoringTypeElementValues.map[json["scoringType"]]!,
        leaderboardStandardPlayers1: json["leaderboard_standard_players_1"],
        leaderboardElitePlayers1: json["leaderboard_elite_players_1"],
        metadataStandard: json["metadataStandard"],
        metadataElite: json["metadataElite"],
        isFavorite: json["isFavorite"] ??
            false, // Valor predeterminado a false si no se proporciona
      );
}

enum ScoringTypeElement { GAME_TIME, LEAST_CASH, LEAST_TIERS }

final scoringTypeElementValues = EnumValues({
  "GameTime": ScoringTypeElement.GAME_TIME,
  "LeastCash": ScoringTypeElement.LEAST_CASH,
  "LeastTiers": ScoringTypeElement.LEAST_TIERS
});
