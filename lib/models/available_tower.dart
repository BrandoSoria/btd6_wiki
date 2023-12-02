import 'dart:convert';

class AvailableTower {
    String tower;
    int max;
    int path1NumBlockedTiers;
    int path2NumBlockedTiers;
    int path3NumBlockedTiers;
    bool isHero;

    AvailableTower({
        required this.tower,
        required this.max,
        required this.path1NumBlockedTiers,
        required this.path2NumBlockedTiers,
        required this.path3NumBlockedTiers,
        required this.isHero,
    });

    factory AvailableTower.fromRawJson(String str) => AvailableTower.fromJson(json.decode(str));

    // String toRawJson() => json.encode(toJson());

    factory AvailableTower.fromJson(Map<String, dynamic> json) => AvailableTower(
        tower: json["tower"],
        max: json["max"],
        path1NumBlockedTiers: json["path1NumBlockedTiers"],
        path2NumBlockedTiers: json["path2NumBlockedTiers"],
        path3NumBlockedTiers: json["path3NumBlockedTiers"],
        isHero: json["isHero"],
    );

    // Map<String, dynamic> toJson() => {
    //     "tower": tower,
    //     "max": max,
    //     "path1NumBlockedTiers": path1NumBlockedTiers,
    //     "path2NumBlockedTiers": path2NumBlockedTiers,
    //     "path3NumBlockedTiers": path3NumBlockedTiers,
    //     "isHero": isHero,
    // };
}
