import 'package:flutter/cupertino.dart';
import 'package:osteoapp/models/AnimalModel.dart';
import 'package:osteoapp/screens/animal/DogDetails.dart';
import 'package:osteoapp/screens/animal/HorseDetails.dart';

class AnimalManagementScreen extends StatelessWidget {
  AnimalModel animalModel;
  AnimalManagementScreen({
    required this.animalModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (animalModel.type == "horse") {
      return HorseDetailsScreen();
    } else if (animalModel.type == "chien") {
      return DogDetailsScreen();
    }
    return Text("${animalModel.type}");
  }
}
