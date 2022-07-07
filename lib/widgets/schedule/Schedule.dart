import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:osteoapp/widgets/schedule/CardScheduleWidget.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 21.0,
              color: Color(0xff5b418f),
            ),
            Container(
              color: Color(0xff5b418f),
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TopRow(),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          7,
                          (index) => DateWidget(
                                index: index,
                              )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  CardScheduleWidget(
                    name: 'Opération',
                    nameClient: 'Bernard',
                    description: 'Couper les couilles de bernard',
                    dateStart: '14h30',
                    dateStop: '15h30',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopRow extends StatelessWidget {
  const TopRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Jan',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class DateWidget extends StatefulWidget {
  final index;
  const DateWidget({Key? key, this.index}) : super(key: key);

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  bool _selectDate = true;
  var list = ["Lun.", "Mar.", "Mer.", "Jeu.", "Ven.", "Sam.", "Dim."];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectDate = !_selectDate;
        });
      },
      child: Container(
        decoration: _selectDate
            ? null
            : BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              list[widget.index],
              style: TextStyle(
                fontWeight: _selectDate ? FontWeight.normal : FontWeight.bold,
                color: _selectDate ? Color(0xff8e7daf) : Colors.white,
              ),
            ),
            Text(
              '${10 + widget.index}',
              style: TextStyle(
                fontWeight: _selectDate ? FontWeight.normal : FontWeight.bold,
                color: _selectDate ? Color(0xff8e7daf) : Colors.white,
              ),
            ),
            Container(
              width: 4.0,
              height: 4.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _selectDate ? Colors.white : Color(0xff8e7daf),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
