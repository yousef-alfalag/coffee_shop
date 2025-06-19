import 'package:coffee_shop/core/routes/routes_name.dart';
import 'package:coffee_shop/features/delivery/presentation/view/delivery_view.dart';
import 'package:coffee_shop/features/home/presentation/view/home_view.dart';
import 'package:coffee_shop/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:get/get.dart';

List <GetPage> routes=[
  GetPage(name: '/', page: ()=>const OnboardingView()),
  GetPage(name: RoutesName.homeView, page: ()=>const HomeView()),
  GetPage(name: RoutesName.deliveryView, page: ()=>const DeliveryView()),
];