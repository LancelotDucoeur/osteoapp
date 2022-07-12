import 'package:flutter/material.dart';
import 'package:osteoapp/widgets/animalsTableData.dart';

class ClientDetailsScreen extends StatelessWidget {
  final String firstname;
  final String lastname;
  final String tel;
  final String addrNum;
  final String addrStreet;
  final String addrCode;
  final String addrCity;
  final String email;

  ClientDetailsScreen({
    Key? key,
    this.firstname = '',
    this.lastname = '',
    this.tel = '',
    this.addrNum = '',
    this.addrStreet = '',
    this.addrCode = '',
    this.addrCity = '',
    this.email = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Nom: $firstname",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Prénom: $lastname",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Tél.: $tel",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Adresse: $addrNum $addrStreet, $addrCode $addrCity",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "E-mail: $email",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 25,
              ),
              AnimalsTableDataWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
