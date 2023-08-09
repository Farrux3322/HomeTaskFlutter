class DynamicView {
  final String title;
  final int sort;
  final String group;
  final num width;
  final num height;
  final String color;
  final String type;

  DynamicView({
    required this.title,
    required this.sort,
    required this.group,
    required this.width,
    required this.height,
    required this.color,
    required this.type,
  });

  factory DynamicView.fromJson(Map<String, dynamic> map) {
    return DynamicView(
      title: map["title"] as String? ?? "",
      sort: map["sort"] as int? ?? 0,
      group: map["group"] as String? ?? "",
      width: map["width"] as num? ?? 0,
      height: map["height"] as num? ?? 0,
      color: map["color"] as String? ?? "000000",
      type: map["type"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "sort": sort,
      "group": group,
      "width": width,
      "height": height,
      "color": color,
      "type": type
    };
  }

}
