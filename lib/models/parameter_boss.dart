import 'dart:convert';

import 'package:configuracion_loggin/models/bosses_response.dart';

class Parameters {
  BossType id;
  BossType name;
  BossType start;
  BossType end;
  BossType bossType;
  BossType bossTypeUrl;
  BossType totalScoresStandard;
  BossType totalScoresElite;
  BossType leaderboardStandardPlayers1;
  BossType leaderboardElitePlayers1;
  BossType metadataStandard;
  BossType metadataElite;
  ScoringType scoringType;

  Parameters({
    required this.id,
    required this.name,
    required this.start,
    required this.end,
    required this.bossType,
    required this.bossTypeUrl,
    required this.totalScoresStandard,
    required this.totalScoresElite,
    required this.leaderboardStandardPlayers1,
    required this.leaderboardElitePlayers1,
    required this.metadataStandard,
    required this.metadataElite,
    required this.scoringType,
  });

  factory Parameters.fromRawJson(String str) =>
      Parameters.fromJson(json.decode(str));


  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        id: BossType.fromJson(json["id"]),
        name: BossType.fromJson(json["name"]),
        start: BossType.fromJson(json["start"]),
        end: BossType.fromJson(json["end"]),
        bossType: BossType.fromJson(json["bossType"]),
        bossTypeUrl: BossType.fromJson(json["bossTypeURL"]),
        totalScoresStandard: BossType.fromJson(json["totalScores_standard"]),
        totalScoresElite: BossType.fromJson(json["totalScores_elite"]),
        leaderboardStandardPlayers1:
            BossType.fromJson(json["leaderboard_standard_players_1"]),
        leaderboardElitePlayers1:
            BossType.fromJson(json["leaderboard_elite_players_1"]),
        metadataStandard: BossType.fromJson(json["metadataStandard"]),
        metadataElite: BossType.fromJson(json["metadataElite"]),
        scoringType: ScoringType.fromJson(json["scoringType"]),
      );

 
      }