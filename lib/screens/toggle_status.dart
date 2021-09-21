import 'package:CWCFlutter/controllers/restaurant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ToggleStatus extends StatelessWidget {
  final restaurantController = RestaurantController.to;
  @override
  Widget build(BuildContext context) {
    print("ToggleStatus screen building...");

    return Scaffold(
      appBar: AppBar(title: Text("Test Status Toggle")),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Is the restuarant open?",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Obx(
                () => Switch(
                  onChanged: (value) => restaurantController.setIsOpen(value),
                  activeColor: Colors.purple,
                  value: restaurantController.isOpen.value,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
