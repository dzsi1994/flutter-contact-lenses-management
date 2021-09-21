import 'package:CWCFlutter/controllers/restaurant_controller.dart';
import 'package:CWCFlutter/widget/rounded_input.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class AddFollowers extends StatelessWidget {
  const AddFollowers({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final restaurantController = RestaurantController.to;
    print("AddFollowers screen building...");

    return Scaffold(
      appBar: AppBar(title: Text("Test Follower List")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            RoundedInput(
              hintText: "Follower Name",
              onSubmit: (value) => restaurantController.addFollower(value),
            ),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: restaurantController.followerList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(restaurantController.followerList[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
