import 'dart:convert';

class DefaultOwer {
    String name;
    int quantity;

    DefaultOwer({
        required this.name,
        required this.quantity,
    });

    factory DefaultOwer.fromRawJson(String str) => DefaultOwer.fromJson(json.decode(str));

    // String toRawJson() => json.encode(toJson());

    factory DefaultOwer.fromJson(Map<String, dynamic> json) => DefaultOwer(
        name: json["name"],
        quantity: json["quantity"],
    );

    // Map<String, dynamic> toJson() => {
    //     "name": name,
    //     "quantity": quantity,
    // };
}
