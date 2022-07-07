import 'package:flutter/material.dart';
import 'package:osteoapp/models/MeetingModel.dart';

class CardScheduleWidget extends StatelessWidget {
  String nameClient;
  String name;
  String description;
  String dateStart;
  String dateStop;

  CardScheduleWidget({
    Key? key,
    this.name = '',
    this.nameClient = '',
    this.description = '',
    this.dateStart = '',
    this.dateStop = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                '$dateStart',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              LineGen(
                lines: [20.0, 30.0, 40.0, 10.0],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 12.0,
        ),
        Expanded(
          child: Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: Color(0xff654f91),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(
                left: 4.0,
              ),
              padding: EdgeInsets.only(
                left: 16.0,
                top: 8.0,
              ),
              color: Color(0xfffcf9f5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 21.0,
                    child: Row(children: [
                      Text('$dateStart - $dateStop'),
                      VerticalDivider(),
                      Text('$nameClient')
                    ]),
                  ),
                  Text('$name',
                      style: TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text('$description'),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class LineGen extends StatelessWidget {
  final lines;
  const LineGen({
    Key? key,
    this.lines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          4,
          (index) => Container(
                height: 2.0,
                width: lines[index],
                color: Color(0xffd1d3d9),
                margin: EdgeInsets.symmetric(vertical: 14.0),
              )),
    );
  }
}
