import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:osteoapp/models/ClientModel.dart';
import 'package:osteoapp/models/MeetingModel.dart';
import 'package:osteoapp/screens/planning/Planning.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddMeetingScreen extends StatefulWidget {
  const AddMeetingScreen({Key? key}) : super(key: key);

  @override
  State<AddMeetingScreen> createState() => _AddMeetingScreenState();
}

class _AddMeetingScreenState extends State<AddMeetingScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController clientController = TextEditingController();
  TextEditingController colorController = TextEditingController();

  List<ClientModel> clients = [];
  ClientModel _selectedClient = ClientModel();
  DateTime dateTimeStart = DateTime.now();
  DateTime dateTimeStop = DateTime.now().add(
    Duration(hours: 1, minutes: 30),
  );
  Color colorPick = Color(0xff0000FF);

  late SharedPreferences preferences;

  @override
  initState() {
    super.initState();
    init();
  }

  Future init() async {
    preferences = await SharedPreferences.getInstance();

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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          'Ajouter rendez-vous',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        )),
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
                          Row(
                            children: [
                              DropdownButton(
                                hint: Text("Selectionnez client"),
                                onChanged: (ClientModel? newValue) {
                                  setState(() {
                                    _selectedClient = newValue!;
                                  });
                                },
                                items: clients.map((client) {
                                  return DropdownMenuItem(
                                      value: client,
                                      child: Text(client.lastname +
                                          " " +
                                          client.firstname));
                                }).toList(),
                              ),
                              Text(_selectedClient.lastname +
                                  " " +
                                  _selectedClient.firstname)
                            ],
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Sujet',
                            ),
                            controller: nameController,
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
                              labelText: 'Desciption',
                            ),
                            controller: descriptionController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          ElevatedButton(
                            child: Text(
                                '${dateTimeStart.year}/${dateTimeStart.month}/${dateTimeStart.day} à ${dateTimeStart.hour}:${dateTimeStart.minute} jusqu ${dateTimeStop.hour}:${dateTimeStop.minute}'),
                            onPressed: pickDateTime,
                          ),
                          ClipRect(
                            child: Align(
                              alignment: Alignment.topCenter,
                              heightFactor: 0.65,
                              child: ColorPicker(
                                colorPickerWidth: 250,
                                pickerColor: colorPick,
                                onColorChanged: (Color color) => setState(() {
                                  colorPick = color;
                                }),
                                enableAlpha: false,
                                paletteType: PaletteType.hueWheel,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_selectedClient.id != -1) {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        duration: const Duration(seconds: 1),
                                        content: Text('Enregistrement...')),
                                  );

                                  List<MeetingModel> meetings = [];
                                  SharedPreferences sharedPreferences =
                                      await SharedPreferences.getInstance();

                                  List<String>? meetingString =
                                      sharedPreferences
                                          .getStringList('meetings');

                                  if (meetingString != null) {
                                    meetings = meetingString
                                        .map((meeting) => MeetingModel.fromJson(
                                            json.decode(meeting)))
                                        .toList();
                                  }
                                  int idTop = 0;

                                  for (var i = 0; i < meetings.length; i++) {
                                    if (idTop < meetings[i].id)
                                      idTop = meetings[i].id;
                                  }

                                  MeetingModel meetingModel = MeetingModel(
                                      id: idTop + 1,
                                      idClient: _selectedClient.id,
                                      name: nameController.text,
                                      description: descriptionController.text,
                                      dateStart: dateTimeStart.toString(),
                                      dateStop: dateTimeStop.toString(),
                                      color: colorPick.value);

                                  meetings.add(meetingModel);

                                  List<String> meetingsEncoded = meetings
                                      .map((meeting) =>
                                          jsonEncode(meeting.toJson()))
                                      .toList();

                                  await sharedPreferences.setStringList(
                                      'meetings', meetingsEncoded);

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PlanningScreen()));
                                }
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Client"),
                                      content: Text(
                                          "Veuillez selectionner un client!"),
                                      actions: [],
                                    );
                                    ;
                                  },
                                );
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

  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return;

    TimeOfDay? timeStart = await pickTime();
    if (timeStart == null) return;

    TimeOfDay? timeStop = await pickTime();
    if (timeStop == null) return;

    final dateTimeStart = DateTime(
      date.year,
      date.month,
      date.day,
      timeStart.hour,
      timeStart.minute,
    );

    final dateTimeStop = DateTime(
      date.year,
      date.month,
      date.day,
      timeStop.hour,
      timeStop.minute,
    );
    setState(() {
      this.dateTimeStart = dateTimeStart;
      this.dateTimeStop = dateTimeStop;
    });
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: dateTimeStart.hour, minute: dateTimeStart.minute),
      builder: (context, childWidget) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(
                // Using 24-Hour format
                alwaysUse24HourFormat: true),
            // If you want 12-Hour format, just change alwaysUse24HourFormat to false or remove all the builder argument
            child: childWidget!);
      });
}
