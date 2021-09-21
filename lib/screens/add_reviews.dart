import 'package:CWCFlutter/controllers/restaurant_controller.dart';
import 'package:CWCFlutter/widget/rounded_input.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class AddReviews extends StatelessWidget {
  final nameInputController = TextEditingController();
  final reviewInputController = TextEditingController();
  final restaurantController = RestaurantController.to;

  @override
  Widget build(BuildContext context) {
    print("AddReviews screen building...");

    return Scaffold(
      appBar: AppBar(title: Text("Test Reviews")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RoundedInput(
              hintText: "Name",
              onSubmit: (value) => print(value),
              editingController: nameInputController,
            ),
            SizedBox(height: 16),
            RoundedInput(
              hintText: "Review",
              onSubmit: (value) => print(value),
              editingController: reviewInputController,
            ),
            SizedBox(height: 16),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () => restaurantController.addReview(
                  nameInputController.text, reviewInputController.text),
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 28),
              ),
            ),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: restaurantController.reviews.length,
                itemBuilder: (context, index) {
                  MapEntry reviewEntry =
                      restaurantController.reviews.entries.elementAt(index);
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
            )
          ],
        ),
      ),
    );
  }
}
