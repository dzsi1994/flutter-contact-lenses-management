import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class RestaurantController extends GetxController {
  final name = 'Pizza hut'.obs;
  final followerCount = 0.obs;
  final isOpen = true.obs;
  final followerList = [].obs;
  final reviews = <String, String>{}.obs;
  final contactInStore = 0;
  final storage = GetStorage();

  static RestaurantController get to => Get.find<RestaurantController>();

  @override
  void onInit() async {
    super.onInit();
    followerCount.value = await storage.read('contactInStore') ?? 0;
    print(storage.read('contactInStore'));
    print(storage.read('last_time_changed'));
  }

  Future<void> initStorage() async {
    await GetStorage.init();
  }

  setName(String restaurantName) {
    name(restaurantName);
  }

  incrementCount() {
    followerCount(followerCount.value + 1);
    storage.write('contactInStore', followerCount.value);
  }

  decrementCount() {
    followerCount(followerCount.value - 1);
    storage.write('contactInStore', followerCount.value);
  }

  setIsOpen(bool open) {
    isOpen(open);
  }

  setFollowerList(List<String> list) {
    followerList.assignAll(list);
  }

  addFollower(String followerName) {
    followerList.add(followerName);
  }

  removeFollower(String followerName) {
    followerList.remove(followerName);
  }

  addReview(String name, String review) {
    reviews.assign(name, review);
  }

  removeReview(String name) {
    reviews.remove(name);
  }
}
