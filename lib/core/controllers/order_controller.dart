import 'package:get/get.dart';

abstract class OrderController extends GetxController {
  selectDeliveryType(String type);
}

class OrderControllerImp extends OrderController {
  bool isDeliverySelected = false;
  @override
  selectDeliveryType(String type) {
    isDeliverySelected = type == 'delivery';
    print(isDeliverySelected);
    update();
  }
  
}