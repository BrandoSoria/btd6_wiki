import 'dart:convert';

class AvailablePower {
    String power;
    int max;

    AvailablePower({
        required this.power,
        required this.max,
    });

    factory AvailablePower.fromRawJson(String str) => AvailablePower.fromJson(json.decode(str));

    // String toRawJson() => json.encode(toJson());

    factory AvailablePower.fromJson(Map<String, dynamic> json) => AvailablePower(
        power: json["power"],
        max: json["max"],
    );

    // Map<String, dynamic> toJson() => {
    //     "power": power,
    //     "max": max,
    // };
}