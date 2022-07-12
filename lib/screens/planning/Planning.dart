import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:osteoapp/models/ClientModel.dart';
import 'package:osteoapp/models/MeetingModel.dart';
import 'package:osteoapp/screens/planning/AddMeeting.dart';
import 'package:osteoapp/screens/client/ClientDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:osteoapp/widgets/navigation_drawer.dart';

class PlanningScreen extends StatefulWidget {
  @override
  State<PlanningScreen> createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {
  List<MeetingModel> meetings = <MeetingModel>[];

  @override
  void initState() {
    // TODO: implement initState
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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('planning'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddMeetingScreen()))
          },
          child: Icon(Icons.add),
        ),
        body: SfCalendar(
          view: CalendarView.week,
          dataSource: MeetingDataSource(this.meetings),
          // by default the month appointment display mode set as Indicator, we can
          // change the display mode as appointment using the appointment display
          // mode property
          monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
          onTap: calendarTapped,
        ),
      ),
    );
  }

  void calendarTapped(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.appointment ||
        details.targetElement == CalendarElement.agenda) {
      MeetingModel detailsAppointments = details.appointments?[0];
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Container(child: new Text('${detailsAppointments.name}')),
              content: Container(
                height: 80,
                child: Column(
                  children: [
                    Text(
                      '${detailsAppointments.description}',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${DateTime.parse(detailsAppointments.dateStart).day}/${DateTime.parse(detailsAppointments.dateStart).month}/${DateTime.parse(detailsAppointments.dateStart).year} à ${DateTime.parse(detailsAppointments.dateStart).hour}:${DateTime.parse(detailsAppointments.dateStart).minute} à ${DateTime.parse(detailsAppointments.dateStop).hour}:${DateTime.parse(detailsAppointments.dateStop).minute}',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () async {
                      List<ClientModel> clients = <ClientModel>[];
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      List<String>? clientString =
                          sharedPreferences.getStringList('clients');

                      if (clientString != null) {
                        //print(meetingString);
                        setState(() {
                          //CONVERT LIST<STRING> IN LIST<MODELCLIENT>
                          clients = clientString
                              .map((client) =>
                                  ClientModel.fromJson(json.decode(client)))
                              .toList();
                        });
                      }

                      int index = clients.indexWhere((element) =>
                          element.id == detailsAppointments.idClient);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => ClientDetailsScreen(
                                firstname: clients[index].firstname,
                                lastname: clients[index].lastname,
                                tel: clients[index].tel,
                                addrNum: clients[index].addrNum,
                                addrStreet: clients[index].addrStreet,
                                addrCode: clients[index].addrCode,
                                addrCity: clients[index].addrCity,
                                email: clients[index].email,
                              ))));
                    },
                    child: new Text('Fiche client')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: new Text('Y aller')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: new Text('Fermer'))
              ],
            );
          });
    }
  }
}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<MeetingModel>? source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return DateTime.parse(_getMeetingData(index).dateStart);
  }

  @override
  DateTime getEndTime(int index) {
    return DateTime.parse(_getMeetingData(index).dateStop);
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).name;
  }

  @override
  Color getColor(int index) {
    return Color(_getMeetingData(index).color);
  }

  @override
  String getNotes(int index) {
    return _getMeetingData(index).description;
  }

  MeetingModel _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final MeetingModel meetingData;
    if (meeting is MeetingModel) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;
}
