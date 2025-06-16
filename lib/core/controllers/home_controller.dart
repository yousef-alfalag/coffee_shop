import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  onOptionPressed(index);
  onBottomNavPressed(index);
}

class HomeControllerImp extends HomeController {
  int selectedOption = 0;
  int selectedBottomNav = 0;

  @override
  onOptionPressed(index) {
    selectedOption = index;
    update();
  }

  @override
  onBottomNavPressed(index) {
    selectedBottomNav = index;
    update();
  }
}
