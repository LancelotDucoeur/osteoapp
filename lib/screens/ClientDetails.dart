import 'package:flutter/material.dart';

class ClientDetailsScreen extends StatelessWidget {
  final String firstname;
  final String lastname;
  final String tel;
  final String addrNum;
  final String addrStreet;
  final String addrCode;
  final String addrCity;

  const ClientDetailsScreen({
    Key? key,
    this.firstname = '',
    this.lastname = '',
    this.tel = '',
    this.addrNum = '',
    this.addrStreet = '',
    this.addrCode = '',
    this.addrCity = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(firstname),
        ),
      ),
    );
  }
}
