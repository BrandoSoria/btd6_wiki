import 'dart:convert';

import 'package:configuracion_loggin/models/models.dart';

class Model {
  String name;
  Map<String, Parameter> parameters;

  Model({
    required this.name,
    required this.parameters,
  });

  factory Model.fromRawJson(String str) => Model.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        name: json["name"],
        parameters: Map.from(json["parameters"]).map(
            (k, v) => MapEntry<String, Parameter>(k, Parameter.fromJson(v))),
      );

  // Map<String, dynamic> toJson() => {
  //     "name": name,
  //     "parameters": Map.from(parameters).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  // };
}
