import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class InputModel {
  @JsonKey(defaultValue: "", name: "title")
  String title;

  @JsonKey(defaultValue: 1, name: "sort")
  int sort;

  @JsonKey(defaultValue: "", name: "group")
  String group;

  @JsonKey(defaultValue: 0, name: "width")
  num width;

  @JsonKey(defaultValue: "", name: "height")
  num height;

  @JsonKey(defaultValue: "000000", name: "color")
  String color;

  @JsonKey(defaultValue: "", name: "type")
  String type;

  InputModel({
    required this.type,
    required this.color,
    required this.height,
    required this.width,
    required this.group,
    required this.sort,
    required this.title,
  });

  factory InputModel.fromJson(Map<String, dynamic> json) =>
      _$InputModelFromJson(json);

  Map<String, dynamic> toJson() => _$InputModelToJson(this);
}
