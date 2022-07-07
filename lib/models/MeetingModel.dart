import 'dart:ui';

class MeetingModel {
  int id;
  String name;
  String description;
  DateTime dateStart;
  DateTime dateStop;
  Color color;
  bool isAllDay;

  MeetingModel(this.id, this.name, this.description, this.dateStart,
      this.dateStop, this.color, this.isAllDay);

/*
  static MeetingModel fromJson(Map<String, dynamic> json) => MeetingModel(
        id: json['id'],
        idClient: json['idClient'],
        name: json['name'],
        description: json['description'],
        dateStart: json['dateStart'],
        dateStop: json['dateStop'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'idClient': idClient,
        'name': name,
        'description': description,
        'dateStart': dateStart,
        'dateStop': dateStop,
      };

  @override
  String toString() {
    return '"clients" : { "id": $id, "idClient": $idClient "name": $name, "description": $description, "dateStart": $dateStart, "dateStop": $dateStop}';
  }*/
}
