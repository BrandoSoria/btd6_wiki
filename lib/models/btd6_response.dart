import 'dart:convert';

import 'package:configuracion_loggin/models/models.dart';


class Odysseybt6Response {
    dynamic error;
    bool success;
    Body body;
    Model model;
    dynamic next;
    dynamic prev;

    Odysseybt6Response({
        required this.error,
        required this.success,
        required this.body,
        required this.model,
        required this.next,
        required this.prev,
    });

    factory Odysseybt6Response.fromRawJson(String str) => Odysseybt6Response.fromJson(json.decode(str));

    // String toRawJson() => json.encode(toJson());

    factory Odysseybt6Response.fromJson(Map<String, dynamic> json) => Odysseybt6Response(
        error: json["error"],
        success: json["success"],
        body: Body.fromJson(json["body"]),
        model: Model.fromJson(json["model"]),
        next: json["next"],
        prev: json["prev"],
    );

    // Map<String, dynamic> toJson() => {
    //     "error": error,
    //     "success": success,
    //     "body": body.toJson(),
    //     "model": model.toJson(),
    //     "next": next,
    //     "prev": prev,
    // };
}

// class Body {
//     String id;
//     bool isExtreme;
//     int maxMonkeySeats;
//     int maxMonkeysOnBoat;
//     int maxPowerSlots;
//     int startingHealth;
//     List<String> rewards;
//     List<AvailablePower> availablePowers;
//     List<AvailableTower> availableTowers;
//     List<DefaultOwer> defaultPowers;
//     List<DefaultOwer> defaultTowers;
//     String maps;

//     Body({
//         required this.id,
//         required this.isExtreme,
//         required this.maxMonkeySeats,
//         required this.maxMonkeysOnBoat,
//         required this.maxPowerSlots,
//         required this.startingHealth,
//         required this.rewards,
//         required this.availablePowers,
//         required this.availableTowers,
//         required this.defaultPowers,
//         required this.defaultTowers,
//         required this.maps,
//     });

//     factory Body.fromRawJson(String str) => Body.fromJson(json.decode(str));

//     // String toRawJson() => json.encode(toJson());

//     factory Body.fromJson(Map<String, dynamic> json) => Body(
//         id: json["id"],
//         isExtreme: json["isExtreme"],
//         maxMonkeySeats: json["maxMonkeySeats"],
//         maxMonkeysOnBoat: json["maxMonkeysOnBoat"],
//         maxPowerSlots: json["maxPowerSlots"],
//         startingHealth: json["startingHealth"],
//         rewards: List<String>.from(json["_rewards"].map((x) => x)),
//         availablePowers: List<AvailablePower>.from(json["_availablePowers"].map((x) => AvailablePower.fromJson(x))),
//         availableTowers: List<AvailableTower>.from(json["_availableTowers"].map((x) => AvailableTower.fromJson(x))),
//         defaultPowers: List<DefaultOwer>.from(json["_defaultPowers"].map((x) => DefaultOwer.fromJson(x))),
//         defaultTowers: List<DefaultOwer>.from(json["_defaultTowers"].map((x) => DefaultOwer.fromJson(x))),
//         maps: json["maps"],
//     );

//     // Map<String, dynamic> toJson() => {
//     //     "id": id,
//     //     "isExtreme": isExtreme,
//     //     "maxMonkeySeats": maxMonkeySeats,
//     //     "maxMonkeysOnBoat": maxMonkeysOnBoat,
//     //     "maxPowerSlots": maxPowerSlots,
//     //     "startingHealth": startingHealth,
//     //     "_rewards": List<dynamic>.from(rewards.map((x) => x)),
//     //     // "_availablePowers": List<dynamic>.from(availablePowers.map((x) => x.toJson())),
//     //     // "_availableTowers": List<dynamic>.from(availableTowers.map((x) => x.toJson())),
//     //     // "_defaultPowers": List<dynamic>.from(defaultPowers.map((x) => x.toJson())),
//     //     // "_defaultTowers": List<dynamic>.from(defaultTowers.map((x) => x.toJson())),
//     //     "maps": maps,
//     // };
// }

// class AvailablePower {
//     String power;
//     int max;

//     AvailablePower({
//         required this.power,
//         required this.max,
//     });

//     factory AvailablePower.fromRawJson(String str) => AvailablePower.fromJson(json.decode(str));

//     // String toRawJson() => json.encode(toJson());

//     factory AvailablePower.fromJson(Map<String, dynamic> json) => AvailablePower(
//         power: json["power"],
//         max: json["max"],
//     );

//     // Map<String, dynamic> toJson() => {
//     //     "power": power,
//     //     "max": max,
//     // };
// }

// class AvailableTower {
//     String tower;
//     int max;
//     int path1NumBlockedTiers;
//     int path2NumBlockedTiers;
//     int path3NumBlockedTiers;
//     bool isHero;

//     AvailableTower({
//         required this.tower,
//         required this.max,
//         required this.path1NumBlockedTiers,
//         required this.path2NumBlockedTiers,
//         required this.path3NumBlockedTiers,
//         required this.isHero,
//     });

//     factory AvailableTower.fromRawJson(String str) => AvailableTower.fromJson(json.decode(str));

//     // String toRawJson() => json.encode(toJson());

//     factory AvailableTower.fromJson(Map<String, dynamic> json) => AvailableTower(
//         tower: json["tower"],
//         max: json["max"],
//         path1NumBlockedTiers: json["path1NumBlockedTiers"],
//         path2NumBlockedTiers: json["path2NumBlockedTiers"],
//         path3NumBlockedTiers: json["path3NumBlockedTiers"],
//         isHero: json["isHero"],
//     );

//     // Map<String, dynamic> toJson() => {
//     //     "tower": tower,
//     //     "max": max,
//     //     "path1NumBlockedTiers": path1NumBlockedTiers,
//     //     "path2NumBlockedTiers": path2NumBlockedTiers,
//     //     "path3NumBlockedTiers": path3NumBlockedTiers,
//     //     "isHero": isHero,
//     // };
// }

// class DefaultOwer {
//     String name;
//     int quantity;

//     DefaultOwer({
//         required this.name,
//         required this.quantity,
//     });

//     factory DefaultOwer.fromRawJson(String str) => DefaultOwer.fromJson(json.decode(str));

//     // String toRawJson() => json.encode(toJson());

//     factory DefaultOwer.fromJson(Map<String, dynamic> json) => DefaultOwer(
//         name: json["name"],
//         quantity: json["quantity"],
//     );

//     // Map<String, dynamic> toJson() => {
//     //     "name": name,
//     //     "quantity": quantity,
//     // };
// }

// class Model {
//     String name;
//     Map<String, Parameter> parameters;

//     Model({
//         required this.name,
//         required this.parameters,
//     });

//     factory Model.fromRawJson(String str) => Model.fromJson(json.decode(str));

//     // String toRawJson() => json.encode(toJson());

//     factory Model.fromJson(Map<String, dynamic> json) => Model(
//         name: json["name"],
//         parameters: Map.from(json["parameters"]).map((k, v) => MapEntry<String, Parameter>(k, Parameter.fromJson(v))),
//     );

//     // Map<String, dynamic> toJson() => {
//     //     "name": name,
//     //     "parameters": Map.from(parameters).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//     // };
// }

// class Parameter {
//     String description;
//     String type;

//     Parameter({
//         required this.description,
//         required this.type,
//     });

//     factory Parameter.fromRawJson(String str) => Parameter.fromJson(json.decode(str));

//     // String toRawJson() => json.encode(toJson());

//     factory Parameter.fromJson(Map<String, dynamic> json) => Parameter(
//         description: json["description"],
//         type: json["type"],
//     );

//     // Map<String, dynamic> toJson() => {
//     //     "description": description,
//     //     "type": type,
//     // };
// }
