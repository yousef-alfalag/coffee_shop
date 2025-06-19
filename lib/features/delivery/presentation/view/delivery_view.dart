import 'package:coffee_shop/core/utils/app_assets.dart';
import 'package:coffee_shop/core/utils/app_colors.dart';
import 'package:coffee_shop/core/utils/app_style.dart';
import 'package:coffee_shop/core/widgets/custom_icon_button.dart';
import 'package:coffee_shop/test_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DeliveryView extends StatelessWidget {
  const DeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            SizedBox(
              width: 500,
              child: Image.asset(Assets.imagesMaps, fit: BoxFit.fill),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 50),
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    color: AppColors.gray2,
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios_new),
                  ),
                  CustomIconButton(
                    color: AppColors.gray2,
                    onPressed: () {
                      Get.to(TestView(name: 'GPS View'));
                    },
                    icon: SvgPicture.asset(Assets.imagesGps),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 250,
              left: 80,
              child: SizedBox(width: 30,height: 30,child: Image.asset(Assets.imagesDeliveryLocation),)),
            Positioned(
              top: 187,
              left: 93,
              child: SizedBox(width: 210,height: 200,child: Image.asset(Assets.imagesRute1),)),
              Positioned(
              top: 380,
              left: 280,
              child: Container(width: 40,height: 40,
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(color: AppColors.white,borderRadius: BorderRadius.circular(30)),
              child: Image.asset(Assets.imagesBike2,),)),
            Positioned(
              top: 480,
              child: Container(
                width: 450,
                height: 320,
                // alignment: AlignmentDirectional(50, 110),
                decoration: BoxDecoration(color: AppColors.white,borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    Container(
                      height: 4,
                      width: 40,
                      decoration: BoxDecoration(
                        color: AppColors.gray,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      
                    ),
                    SizedBox(height: 15,),
                    Text('10 mintus',style: AppStyle.soraw600Black),
                    Text.rich(TextSpan(children: [
                      TextSpan(text: 'Delivery to ',style: AppStyle.soraw400Gray.copyWith(fontSize: 10)),
                      TextSpan(text: ' Jl. Kpg Sutoyo',style: AppStyle.soraw600Black.copyWith(fontSize: 10)),
                    ])),
                    SizedBox(height: 15,),
                    SizedBox(
                      width: 450,
                      height: 13,
                      child: Center(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(4),
                              height: 4,
                              width: 90,
                              decoration: BoxDecoration(
                                color:
                                    index == 3
                                        ? AppColors.gray
                                        : AppColors.green,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.lightGray,
                        border: Border.all( color: AppColors.gray),
                        borderRadius: BorderRadius.circular(10),
                      ),
      
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(Assets.imagesBike),
                          ),
                          SizedBox(width: 20),
                          SizedBox(
                            height: 60,
                            width: 220,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Delivered your order',style: AppStyle.soraw600Black),
                                Text(
                                  'We will deliver your goods to you in the shortes possible time.',
                                  style: AppStyle.soraw400Gray.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(color: Colors.white),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(Assets.imagesProfile, fit: BoxFit.fill),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Brooklyn Simmons',style: AppStyle.soraw600Black),
                                Text(
                                  'Personal Courier',
                                  style: AppStyle.soraw400Gray.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            border: Border.all(color: AppColors.gray),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(Assets.imagesPhone),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
