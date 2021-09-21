import 'package:CWCFlutter/controllers/restaurant_controller.dart';
import 'package:CWCFlutter/widget/rounded_input.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class EditName extends StatelessWidget {
  final restaurantController = RestaurantController.to;

  @override
  Widget build(BuildContext context) {
    print("EditName screen building...");
    return Scaffold(
      appBar: AppBar(title: Text("Test Name Edit")),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Obx(
              () => Text(
                '${restaurantController.name.value}',
                style: TextStyle(fontSize: 48),
              ),
            ),
            SizedBox(height: 16),
            RoundedInput(
              hintText: "Restauarant Name",
              onSubmit: (value) => restaurantController.setName(value),
            )
          ],
        ),
      ),
    );
  }
}
