import 'package:coffee_shop/core/utils/app_assets.dart';
import 'package:coffee_shop/core/utils/app_colors.dart';
import 'package:coffee_shop/core/utils/app_style.dart';
import 'package:coffee_shop/core/widgets/custom_icon_button.dart';
import 'package:coffee_shop/features/home/data/models/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DetailItemView extends StatelessWidget {
  final CoffeeModel coffeeSelected;
  const DetailItemView({super.key, required this.coffeeSelected});

  @override
  Widget build(BuildContext context) {
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
              children: [
                Text('Ice/Hot'),
                CustomIconButton(color: AppColors.lightGray,icon: SvgPicture.asset(Assets.imagesBike)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomNavBar extends StatelessWidget {
  final String? title;
  final Widget? actionIcon;
  final Color? color;
  const CustomNavBar({super.key, this.title, this.actionIcon, this.color});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: actionIcon == null ? null : [actionIcon!],
      leading: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      title: title == null ? null : Text(title!),
    );
  }
}
