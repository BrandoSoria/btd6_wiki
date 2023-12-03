class Body {
  String id;
  bool isExtreme;
  int maxMonkeySeats;
  int maxMonkeysOnBoat;
  int maxPowerSlots;
  int startingHealth;
  List<String> rewards;
  List<Map<String, dynamic>> availablePowers;
  List<Map<String, dynamic>> availableTowers;
  List<Map<String, dynamic>> defaultPowers;
  List<Map<String, dynamic>> defaultTowers;
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

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["body"]["id"],
        isExtreme: json["body"]["isExtreme"],
        maxMonkeySeats: json["body"]["maxMonkeySeats"],
        maxMonkeysOnBoat: json["body"]["maxMonkeysOnBoat"],
        maxPowerSlots: json["body"]["maxPowerSlots"],
        startingHealth: json["body"]["startingHealth"],
        rewards: List<String>.from(json["body"]["_rewards"]),
        availablePowers:
            List<Map<String, dynamic>>.from(json["body"]["_availablePowers"]),
        availableTowers:
            List<Map<String, dynamic>>.from(json["body"]["_availableTowers"]),
        defaultPowers:
            List<Map<String, dynamic>>.from(json["body"]["_defaultPowers"]),
        defaultTowers:
            List<Map<String, dynamic>>.from(json["body"]["_defaultTowers"]),
        maps: json["body"]["maps"],
      );
}
