import 'package:coffee_shop/core/controllers/home_controller.dart';
import 'package:coffee_shop/core/utils/app_assets.dart';
import 'package:coffee_shop/core/utils/app_colors.dart';
import 'package:coffee_shop/core/utils/app_style.dart';
import 'package:coffee_shop/core/widgets/custom_icon_button.dart';
import 'package:coffee_shop/features/detail%20_item/presentation/view/detail_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller= Get.put(HomeControllerImp());
    return Scaffold(
      bottomNavigationBar: GetBuilder<HomeControllerImp>(
        builder: (controller) {
          return BottomNavigationBar(
            currentIndex: controller.selectedBottomNav,
            onTap: (value) => controller.onBottomNavPressed(value),
            selectedItemColor: AppColors.primaryColor,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.imagesHome),
                // activeIcon: SvgPicture.asset(
                //   Assets.imagesHome,
                //   colorFilter: ColorFilter.mode(
                //     AppColors.primaryColor,
                //     BlendMode.srcIn,
                //   ),
                // ),
                activeIcon: SvgPicture.asset(Assets.imagesHome1),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.imagesHeart),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.imagesBag),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.imagesNotification),
                label: '',
              ),
            ],
          );
        },
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 370,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    height: 280,
                    width: 450,
                    color: AppColors.black,
                    child: SafeArea(
                      minimum: EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Location', style: AppStyle.soraw400Gray),
                          Row(
                            children: [
                              Text(
                                'Bilzen, Tanjungbalai',
                                style: AppStyle.soraw600White.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 300,
                                height: 70,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color.fromARGB(255, 24, 23, 23),
                                      const Color.fromARGB(255, 39, 38, 38),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              CustomIconButton(
                                icon: SvgPicture.asset(
                                  'assets/images/Icon1.svg',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 200, left: 25),
                        width: 400,
                        height: 250,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(23),
                          child: Image.asset(
                            'assets/images/Banner1.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 220, left: 60),
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.red,
                        ),
                        child: Center(
                          child: Text(
                            'Promo',
                            style: AppStyle.soraw600White.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 260, left: 60),
                        width: 250,
                        height: 100,
                        child: Text(
                          'Buy one get one FREE',
                          style: AppStyle.soraw600White.copyWith(fontSize: 35),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 450,
              height: 60,
              child: GetBuilder<HomeControllerImp>(
                builder: (controller) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder:
                        (context, index) => Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color:
                                controller.selectedOption != index
                                    ? AppColors.lightGray
                                    : AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: MaterialButton(
                            onPressed: () => controller.onOptionPressed(index),
                            child: Center(
                              child: Text(
                                'Machiato',
                                style:
                                    controller.selectedOption == index
                                        ? AppStyle.soraw600White.copyWith(
                                          fontSize: 17,
                                        )
                                        : null,
                              ),
                            ),
                          ),
                        ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 600,
              child: GridView.builder(
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder:
                    (context, index) => GestureDetector(
                      onTap: () => Get.to(DetailItemView(coffeeSelected: controller.data[index],)),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 120,
                              width: 200,
                              decoration: BoxDecoration(color: Colors.white),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/3.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Text(
                              'Caffe Mocha',
                              style: AppStyle.soraw600White.copyWith(
                                fontSize: 17,
                                color: AppColors.black,
                              ),
                            ),
                            Text(
                              'Deep Foam',
                              style: AppStyle.soraw400Gray.copyWith(fontSize: 13),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$10',
                                  style: AppStyle.soraw600White.copyWith(
                                    fontSize: 17,
                                    color: AppColors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: CustomIconButton(
                                    icon: Icon(Icons.add, color: AppColors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
