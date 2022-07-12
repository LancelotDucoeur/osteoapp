import 'package:flutter/material.dart';
import 'package:osteoapp/models/AnimalModel.dart';
import 'package:osteoapp/screens/animal/AnimalManagement.dart';
import 'package:osteoapp/screens/animal/HorseDetails.dart';

class AnimalsTableDataWidget extends StatefulWidget {
  const AnimalsTableDataWidget({Key? key}) : super(key: key);

  @override
  State<AnimalsTableDataWidget> createState() => _AnimalsTableDataWidgetState();
}

class _AnimalsTableDataWidgetState extends State<AnimalsTableDataWidget> {
  int? sortColumnIndex;
  bool isAscending = false;

  List<AnimalModel> animals = [
    AnimalModel(name: "toto", type: "horse", age: "3"),
    AnimalModel(name: "dupont", type: "chien", age: "5"),
  ];
  @override
  Widget build(BuildContext context) {
    return buildDataTable();
  }

  Widget buildDataTable() {
    final columns = ['Nom', 'Espèce', 'Age'];
    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(animals),
      showCheckboxColumn: false,
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<AnimalModel> animals) =>
      animals.map((AnimalModel animal) {
        final cells = [animal.name, animal.type, animal.age];
        return DataRow(
          cells: getCells(cells),
          onSelectChanged: (selected) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) =>
                    AnimalManagementScreen(animalModel: animal)),
              ),
            );
          },
        );
      }).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      animals.sort((animal1, animal2) =>
          compareString(ascending, animal1.name, animal2.name));
    } else if (columnIndex == 1) {
      animals.sort((animal1, animal2) =>
          compareString(ascending, animal1.type, animal2.type));
    } else if (columnIndex == 2) {
      animals.sort((animal1, animal2) =>
          compareString(ascending, animal1.age, animal2.age));
    }
    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
