import 'package:flutter/material.dart';

class MeetingModel {
  int id;
  int idClient;
  String name;
  String description;
  String dateStart;
  String dateStop;
  int color;

  MeetingModel({
    this.id = -1,
    this.idClient = -1,
    this.name = '',
    this.description = '',
    required this.dateStart,
    required this.dateStop,
    this.color = -1,
  });

  static MeetingModel fromJson(Map<String, dynamic> json) => MeetingModel(
        id: json['id'],
        idClient: json['idClient'],
        name: json['name'],
        description: json['description'],
        dateStart: json['dateStart'],
        dateStop: json['dateStop'],
        color: json['color'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'idClient': idClient,
        'name': name,
        'description': description,
        'dateStart': dateStart,
        'dateStop': dateStop,
        'color': color,
      };

  @override
  String toString() {
    return '"meeting" : { "id": $id, "idClient": $idClient "name": $name, "description": $description, "dateStart": $dateStart, "dateStop": $dateStop}';
  }
}
