import 'package:CWCFlutter/controllers/restaurant_controller.dart';
import 'package:CWCFlutter/widget/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class EditContactLastTimeChangedPage extends StatefulWidget {
  @override
  _EditContactLastTimeChangedState createState() {
    return _EditContactLastTimeChangedState();
  }
}

class _EditContactLastTimeChangedState
    extends State<EditContactLastTimeChangedPage> {
  final restaurantController = RestaurantController.to;
  final storage = GetStorage();
  String date = "";
  DateTime selectedDate = DateTime.now();
  bool isDateSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Last time changed edit")),
      drawer: SideDrawer(),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text("Choose Date"),
            ),
            Text(
                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}")
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
        isDateSelected = true;
      });
    storage.write('last_time_changed', selectedDate.toString());
    Navigator.of(context).popAndPushNamed(
      'home',
    );
  }
}
