import 'dart:convert';

import 'package:configuracion_loggin/models/parameter_boss.dart';

class Model {
    String name;
    Parameters parameters;

    Model({
        required this.name,
        required this.parameters,
    });

    factory Model.fromRawJson(String str) => Model.fromJson(json.decode(str));


    factory Model.fromJson(Map<String, dynamic> json) => Model(
        name: json["name"],
        parameters: Parameters.fromJson(json["parameters"]),
    );

 
}