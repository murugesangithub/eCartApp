class Country {
  int id;
  String enName;
  String arName;

  Country({this.id, this.enName, this.arName});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'] as int,
      arName: json['arName'] as String,
      enName: json['enName'] as String,
    );
  }
}

class DropDownModel {
  int id;
  String textValue;

  DropDownModel({this.id, this.textValue});

  factory DropDownModel.fromJson(Map<String, dynamic> json) {
    return DropDownModel(
        id: json['id'] as int, textValue: json['textValue'] as String);
  }
}
