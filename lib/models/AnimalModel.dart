class AnimalModel {
  int id;
  String name;
  String type;
  String age;

  AnimalModel({
    this.id = -1,
    this.name = '',
    this.type = '',
    this.age = '',
  });

  static AnimalModel fromJson(Map<String, dynamic> json) => AnimalModel(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        age: json['age'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'age': age,
      };

  @override
  String toString() {
    return '"clients" : { "id": $id "name": $name, "type": $type, "age": $age}';
  }
}
