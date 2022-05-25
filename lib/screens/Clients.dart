import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:osteoapp/screens/AddClient.dart';
import 'package:osteoapp/screens/ClientDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/ClientModel.dart';
import '../widgets/navigation_drawer.dart';

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({Key? key}) : super(key: key);

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  List<ClientModel> clients = [];
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
/*
    clients.add(ClientModel(
      firstname: "Lancelot",
      lastname: 'zaeaz',
      tel: '0783021005',
      addrNum: '14',
      addrStreet: 'rue Edagr Faur',
      addrCode: '21000',
      addrCity: 'Dijon',
    ));
    clients.add(ClientModel(
      firstname: "Lancelot",
      lastname: 'azeazd',
      tel: '0783021005',
      addrNum: '14',
      addrStreet: 'rue Edagr Faur',
      addrCode: '21000',
      addrCity: 'Dijon',
    ));
    clients.add(ClientModel(
      firstname: "Lancelot",
      lastname: 'bdza',
      tel: '0783021005',
      addrNum: '14',
      addrStreet: 'rue Edagr Faur',
      addrCode: '21000',
      addrCity: 'Dijon',
    ));*/

    init();
  }

  //LOAD CLIENTS
  Future init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    List<String>? clientString = sharedPreferences.getStringList('clients');
    if (clientString != null) {
      setState(() {
        //CONVERT LIST<STRING> IN LIST<MODELCLIENT>
        clients = clientString
            .map((client) => ClientModel.fromJson(json.decode(client)))
            .toList();
        //PUT FIRST LETTER OF LASTNAME AND FIRSTNAME IN CAPITAL
        for (var i = 0; i < clients.length; i++) {
          clients[i].lastname = clients[i].lastname[0].toUpperCase() +
              clients[i].lastname.substring(1);
          clients[i].firstname = clients[i].firstname[0].toUpperCase() +
              clients[i].firstname.substring(1);
        }
        //SORT ALPHABETIC BY LASTNAME
        clients.sort((a, b) => a.lastname.compareTo(b.lastname));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Clients'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: clients.isEmpty
              ? const Center(
                  child: Text("Pas de clients !"),
                )
              : ListView.builder(
                  itemCount: clients.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(clients[index].lastname),
                        subtitle: Text(clients[index].firstname),
                        onTap: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) => ClientDetailsScreen(
                                    firstname: clients[index].firstname,
                                    lastname: clients[index].lastname,
                                    tel: clients[index].tel,
                                    addrNum: clients[index].addrNum,
                                    addrStreet: clients[index].addrStreet,
                                    addrCode: clients[index].addrCode,
                                    addrCity: clients[index].addrCity,
                                  )),
                            ),
                          )
                        },
                      ),
                    );
                  }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddClientScreen()))
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
