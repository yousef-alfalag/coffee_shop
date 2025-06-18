import 'package:coffee_shop/core/controllers/detail_item_controller.dart';
import 'package:coffee_shop/core/utils/app_assets.dart';
import 'package:coffee_shop/core/utils/app_colors.dart';
import 'package:coffee_shop/core/utils/app_style.dart';
import 'package:coffee_shop/core/widgets/custom_icon_button.dart';
import 'package:coffee_shop/core/widgets/custom_nav_bar.dart';
import 'package:coffee_shop/core/widgets/primary_button.dart';
import 'package:coffee_shop/features/home/data/models/coffee_model.dart';
import 'package:coffee_shop/features/order/presentation/view/order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DetailItemView extends StatelessWidget {
  final CoffeeModel coffeeSelected;
  const DetailItemView({super.key, required this.coffeeSelected});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DetailItemControllerImp());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 25, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomNavBar(
                title: 'Detail',
                actionIcon: SvgPicture.asset(Assets.imagesHeart),
              ),
            ),
            Center(
              child: Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(color: Colors.white),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    coffeeSelected.imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Text(coffeeSelected.name, style: AppStyle.soraw600Black),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ice/Hot', style: AppStyle.soraw400Gray),
                SizedBox(
                  child: Row(
                    children: [
                      CustomIconButton(
                        color: AppColors.lightGray,
                        icon: SizedBox(
                          width: 25,
                          height: 25,
                          child: Image.asset(Assets.imagesBike),
                        ),
                      ),
                      SizedBox(width: 5),
                      CustomIconButton(
                        color: AppColors.lightGray,
                        icon: SizedBox(
                          width: 25,
                          height: 25,
                          child: Image.asset(Assets.imagesIcon1),
                        ),
                      ),
                      SizedBox(width: 5),
                      CustomIconButton(
                        color: AppColors.lightGray,
                        icon: SizedBox(
                          width: 25,
                          height: 25,
                          child: Image.asset(Assets.imagesMilk),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.star_rounded, color: Colors.amberAccent),
                Text('4.8', style: AppStyle.soraw600Black),
                Text(
                  '(230)',
                  style: AppStyle.soraw400Gray.copyWith(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 5),
            Divider(),
            Text('Description', style: AppStyle.soraw600Black),
            GetBuilder<DetailItemControllerImp>(
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk. The foam is created by steaming the milk, which creates a creamy texture and rich flavor that complements the espresso perfectly.',
                      overflow:
                          controller.isReadMore
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,
                      maxLines: controller.isReadMore ? null : 3,
                      style: AppStyle.soraw400Gray.copyWith(fontSize: 13),
                    ),
                    GestureDetector(
                      onTap: () => controller.isReadMoreChanged(),
                      child: Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Text(
                          controller.isReadMore ? 'Read Less' : 'Read More',
                          style: AppStyle.soraw600Black.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Text('Sise', style: AppStyle.soraw600Black),
            GetBuilder<DetailItemControllerImp>(
              builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Containersize('M'),
                    SizedBox(width: 12),
                    Containersize('S'),
                    SizedBox(width: 12),
                    Containersize('L'),
                  ],
                );
              },
            ),
            SizedBox(height: 70,),
            CustomBottomBar(coffeeSelected: coffeeSelected,),
          ],
        ),
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  final CoffeeModel coffeeSelected;
  const CustomBottomBar({super.key, required this.coffeeSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.all(24),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Price', style: AppStyle.soraw400Gray),
              SizedBox(height: 4),
              Text(
                '\$ 4.53',
                style: AppStyle.soraw600White.copyWith(
                  fontSize: 17,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: 217,
            height: 62,
            child: PrimaryButton(name: 'Buy Now', onPressed: () =>Get.to(OrderView(coffeeOrdered: coffeeSelected,))),
          ),
        ],
      ),
    );
  }
}

class Containersize extends GetView<DetailItemControllerImp> {
  final String size;
  const Containersize(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectSize(size);
      },
      child: Container(
        width: 96,
        height: 41,
        decoration: BoxDecoration(
          color:
              controller.selectedSize == size
                  ? Color(0xFFF9F2ED)
                  : AppColors.lightGray,
          border: Border.all(
            color:
                controller.selectedSize == size
                    ? AppColors.primaryColor
                    : AppColors.gray,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              color: controller.selectedSize == size ? Color(0xFFC67C4E) : null,
            ),
          ),
        ),
      ),
    );
  }
}


