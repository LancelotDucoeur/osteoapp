import 'package:flutter/material.dart';
import 'package:osteoapp/models/ClientModel.dart';
import 'package:osteoapp/screens/Clients.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({Key? key}) : super(key: key);

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  TextEditingController lastnameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController addrNumController = TextEditingController();
  TextEditingController addrStreetController = TextEditingController();
  TextEditingController addrCodeController = TextEditingController();
  TextEditingController addrCityController = TextEditingController();
  ClientModel clientModel = ClientModel();
  late SharedPreferences preferences;

  @override
  initState() {
    super.initState();
    init();
  }

  Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ajouter client'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 20.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Nom',
                            ),
                            controller: firstnameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Prénom',
                            ),
                            controller: lastnameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Téléphone',
                            ),
                            controller: telController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Numéro adresse',
                            ),
                            controller: addrNumController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Label adresse',
                            ),
                            controller: addrStreetController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Code postal',
                            ),
                            controller: addrCodeController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Ville',
                            ),
                            controller: addrCityController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Enregistrement...')),
                                );
                                clientModel = ClientModel(
                                    firstname: firstnameController.text,
                                    lastname: lastnameController.text,
                                    tel: telController.text,
                                    addrNum: addrNumController.text,
                                    addrStreet: addrStreetController.text,
                                    addrCode: addrCodeController.text,
                                    addrCity: addrCityController.text);

                                List<ClientModel> clients = [];
                                SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();

                                List<String>? clientString =
                                    sharedPreferences.getStringList('clients');

                                if (clientString != null) {
                                  clients = clientString
                                      .map((client) => ClientModel.fromJson(
                                          json.decode(client)))
                                      .toList();
                                }

                                clients.add(clientModel);

                                List<String> clientsEncoded = clients
                                    .map(
                                        (client) => jsonEncode(client.toJson()))
                                    .toList();

                                await sharedPreferences.setStringList(
                                    'clients', clientsEncoded);

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ClientsScreen()));
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
