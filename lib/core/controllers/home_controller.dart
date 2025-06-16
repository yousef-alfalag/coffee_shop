import 'package:coffee_shop/features/home/data/home_data.dart';
import 'package:coffee_shop/features/home/data/models/coffee_model.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  onOptionPressed(index);
  onBottomNavPressed(index);
}

class HomeControllerImp extends HomeController {
  int selectedOption = 0;
  int selectedBottomNav = 0;
  List<CoffeeModel>data=[];
  @override
  void onInit() {
    initData();
    super.onInit();
  }

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
  initData(){
    data.addAll(homeData.map((element)=>CoffeeModel.fromJson(element)));
  }
}
