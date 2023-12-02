
import 'dart:convert';
import 'package:configuracion_loggin/models/models.dart';

// son las reglas de dicha odisea(modo de juego) del juego
class Body {
    String id;
    bool isExtreme;
    int maxMonkeySeats;
    int maxMonkeysOnBoat;
    int maxPowerSlots;
    int startingHealth;
    List<String> rewards;
    List<AvailablePower> availablePowers;
    List<AvailableTower> availableTowers;
    List<DefaultOwer> defaultPowers;
    List<DefaultOwer> defaultTowers;
    String maps;

    Body({
        required this.id,
        required this.isExtreme,
        required this.maxMonkeySeats,
        required this.maxMonkeysOnBoat,
        required this.maxPowerSlots,
        required this.startingHealth,
        required this.rewards,
        required this.availablePowers,
        required this.availableTowers,
        required this.defaultPowers,
        required this.defaultTowers,
        required this.maps,
    });

    factory Body.fromRawJson(String str) => Body.fromJson(json.decode(str));

    // String toRawJson() => json.encode(toJson());

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        isExtreme: json["isExtreme"],
        maxMonkeySeats: json["maxMonkeySeats"],
        maxMonkeysOnBoat: json["maxMonkeysOnBoat"],
        maxPowerSlots: json["maxPowerSlots"],
        startingHealth: json["startingHealth"],
        rewards: List<String>.from(json["_rewards"]),
        availablePowers: List<AvailablePower>.from(json["_availablePowers"].map((x) => AvailablePower.fromJson(x))),
        availableTowers: List<AvailableTower>.from(json["_availableTowers"].map((x) => AvailableTower.fromJson(x))),
        defaultPowers: List<DefaultOwer>.from(json["_defaultPowers"].map((x) => DefaultOwer.fromJson(x))),
        defaultTowers: List<DefaultOwer>.from(json["_defaultTowers"].map((x) => DefaultOwer.fromJson(x))),
        maps: json["maps"],
    );

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "isExtreme": isExtreme,
    //     "maxMonkeySeats": maxMonkeySeats,
    //     "maxMonkeysOnBoat": maxMonkeysOnBoat,
    //     "maxPowerSlots": maxPowerSlots,
    //     "startingHealth": startingHealth,
    //     "_rewards": List<dynamic>.from(rewards.map((x) => x)),
    //     // "_availablePowers": List<dynamic>.from(availablePowers.map((x) => x.toJson())),
    //     // "_availableTowers": List<dynamic>.from(availableTowers.map((x) => x.toJson())),
    //     // "_defaultPowers": List<dynamic>.from(defaultPowers.map((x) => x.toJson())),
    //     // "_defaultTowers": List<dynamic>.from(defaultTowers.map((x) => x.toJson())),
    //     "maps": maps,
    // };
}
