import 'dart:convert';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:osteoapp/models/MeetingModel.dart';
import 'package:osteoapp/widgets/navigation_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  List<MeetingModel> meetings = <MeetingModel>[];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? meetingString = sharedPreferences.getStringList('meetings');
    if (meetingString != null) {
      //print(meetingString);
      setState(() {
        //CONVERT LIST<STRING> IN LIST<MODELCLIENT>
        meetings = meetingString
            .map((meeting) => MeetingModel.fromJson(json.decode(meeting)))
            .toList();
        meetings.removeWhere((meeting) =>
            DateTime.parse(meeting.dateStart).isBefore(DateTime.now()));
        meetings.sort((a, b) => a.dateStart.compareTo(b.dateStart));
        if (meetings.length > 3) meetings.removeRange(3, meetings.length);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(
            'Accueil',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
        body: Center(
          child: meetings.isEmpty
              ? const Center(
                  child: Text("Pas de rendez-vous !"),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text("Prochain(s) rendez-vous"),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: meetings.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(meetings[index].name),
                                subtitle: Text(meetings[index].dateStart),
                                onTap: () => {},
                              ),
                            );
                          }),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
