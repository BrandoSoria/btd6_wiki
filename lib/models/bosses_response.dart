import 'dart:convert';
import 'package:configuracion_loggin/models/body_boss.dart';
import 'package:configuracion_loggin/models/model_boss.dart';

class BossesResponse {
  dynamic error;
  bool success;
  List<BodyBoss> body;
  Model model;
  dynamic next;
  dynamic prev;

  BossesResponse({
    required this.error,
    required this.success,
    required this.body,
    required this.model,
    required this.next,
    required this.prev,
  });

  factory BossesResponse.fromRawJson(String str) =>
      BossesResponse.fromJson(json.decode(str));

  factory BossesResponse.fromJson(Map<String, dynamic> json) => BossesResponse(
        error: json["error"],
        success: json["success"],
        body:
            List<BodyBoss>.from(json["body"].map((x) => BodyBoss.fromJson(x))),
        model: Model.fromJson(json["model"]),
        next: json["next"],
        prev: json["prev"],
      );
}

class BossType {
  String description;
  Type type;

  BossType({
    required this.description,
    required this.type,
  });

  factory BossType.fromRawJson(String str) =>
      BossType.fromJson(json.decode(str));

  factory BossType.fromJson(Map<String, dynamic> json) => BossType(
        description: json["description"],
        type: typeValues.map[json["type"]]!,
      );
}

enum Type { ASSET_URL, NUMBER, STRING }

final typeValues = EnumValues(
    {"assetURL": Type.ASSET_URL, "number": Type.NUMBER, "string": Type.STRING});

class ScoringType {
  String description;
  Type type;
  List<ScoringTypeElement> allowed;

  ScoringType({
    required this.description,
    required this.type,
    required this.allowed,
  });

  factory ScoringType.fromRawJson(String str) =>
      ScoringType.fromJson(json.decode(str));

  factory ScoringType.fromJson(Map<String, dynamic> json) => ScoringType(
        description: json["description"],
        type: typeValues.map[json["type"]]!,
        allowed: List<ScoringTypeElement>.from(
            json["allowed"].map((x) => scoringTypeElementValues.map[x]!)),
      );
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
