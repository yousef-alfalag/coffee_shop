import 'dart:ffi';

import 'package:get/get.dart';

abstract class DetailItemController extends GetxController {
  isReadMoreChanged();
  selectSize(size);
}

class DetailItemControllerImp extends DetailItemController {
  bool isReadMore = false;
  String selectedSize='M';
  
  @override
  isReadMoreChanged() {
   isReadMore=!isReadMore;
   update();
  }
  
  @override
  selectSize(size) {
    selectedSize=size;
    update();
  }
}