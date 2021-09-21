import 'package:CWCFlutter/controllers/restaurant_controller.dart';
import 'package:CWCFlutter/widget/card_info.dart';
import 'package:CWCFlutter/widget/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class Home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  DateTime _lastTimeChanged;
  final restaurantController = Get.put(RestaurantController());
  final datacount = GetStorage();
  int _differenceInDays = 5;
  @override
  void initState() {
    super.initState();
    if (datacount.read('last_time_changed') != null) {
      _lastTimeChanged = DateTime.tryParse(datacount.read('last_time_changed'));
      var today = DateTime.now();
      var thirtyDaysFromNow = _lastTimeChanged.add(new Duration(days: 30));
      _differenceInDays = thirtyDaysFromNow.difference(today).inDays;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("GetX Tutorial")),
      drawer: SideDrawer(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InfoCard(
                title: "General",
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Obx(
                      () => Text(
                        '${restaurantController.name.value}',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    SizedBox(height: 4),
                    Obx(
                      () => Text(
                        'Followers: ${restaurantController.followerCount.value.toString()}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 4),
                    Obx(
                      () => Text(
                          restaurantController.isOpen.value
                              ? 'Opened'
                              : 'Closed',
                          style: TextStyle(
                              color: restaurantController.isOpen.value
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 18)),
                    ),
                  ],
                ),
              ),
              InfoCard(
                  title: "Followers",
                  body: Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: restaurantController.followerList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          child: Text(
                            restaurantController.followerList[index],
                            style: TextStyle(fontSize: 16),
                          ),
                          padding: EdgeInsets.all(8),
                        );
                      },
                    ),
                  )),
              Obx(() => Column(
                    children: <Widget>[
                      restaurantController.isOpen.value == true
                          ? InfoCard(
                              title: "Days left",
                              body: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(height: 8),
                                  Text(
                                    _differenceInDays.toString(),
                                    style: TextStyle(fontSize: 22),
                                  ),
                                ],
                              ))
                          : SizedBox(height: 0.01),
                    ],
                  )),
              InfoCard(
                  title: "Reviews",
                  body: Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      itemCount: restaurantController.reviews.length,
                      itemBuilder: (context, index) {
                        MapEntry reviewEntry = restaurantController
                            .reviews.entries
                            .elementAt(index);
                        return ListTile(
                          title: Column(
                            children: [
                              Text(reviewEntry.key),
                              Text(reviewEntry.value)
                            ],
                          ),
                        );
                      },
                    ),
                  )),
              InfoCard(
                title: "Last Time changed",
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 8),
                    _lastTimeChanged != null
                        ? Text(
                            "${_lastTimeChanged.year}/${_lastTimeChanged.month}/${_lastTimeChanged.day}",
                            style: TextStyle(fontSize: 22),
                          )
                        : SizedBox(height: 0.01),
                    SizedBox(height: 4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).popAndPushNamed(
          'last_time_changed',
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
