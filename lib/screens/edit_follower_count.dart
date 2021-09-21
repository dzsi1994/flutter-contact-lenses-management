import 'package:CWCFlutter/controllers/restaurant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class EditFollowerCount extends StatelessWidget {
  final restaurantController = RestaurantController.to;
  @override
  Widget build(BuildContext context) {
    print("EditFollowerCount screen building...");

    return Scaffold(
      appBar: AppBar(title: Text("Test Follower Count")),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                iconSize: 50,
                onPressed: () {
                  restaurantController.decrementCount();
                },
              ),
              Obx(
                () => Text(
                  '${restaurantController.followerCount.value.toString()}',
                  style: TextStyle(fontSize: 48),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                iconSize: 50,
                onPressed: () {
                  restaurantController.incrementCount();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
