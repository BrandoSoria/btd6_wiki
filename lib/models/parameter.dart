import 'dart:convert';

class Parameter {
    String description;
    String type;

    Parameter({
        required this.description,
        required this.type,
    });

    factory Parameter.fromRawJson(String str) => Parameter.fromJson(json.decode(str));

    // String toRawJson() => json.encode(toJson());

    factory Parameter.fromJson(Map<String, dynamic> json) => Parameter(
        description: json["description"],
        type: json["type"],
    );

    // Map<String, dynamic> toJson() => {
    //     "description": description,
    //     "type": type,
    // };
}
