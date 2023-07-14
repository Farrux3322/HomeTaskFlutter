class Pokemon{

  final int id;
  final String num;
  final String name;
  final String img;

  Pokemon({required this.id,required this.num,required this.img,required this.name});

  factory Pokemon.fromJson(Map<String,dynamic>json){
    return Pokemon(
      id: json["id"],
      num: json["num"],
      name: json["name"],
      img: json["img"],
    );
  }
}