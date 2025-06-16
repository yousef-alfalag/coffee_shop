import 'package:coffee_shop/core/routes/routes_name.dart';
import 'package:coffee_shop/core/utils/app_style.dart';
import 'package:coffee_shop/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Stack(
        children: [
          SizedBox(
            height: 550,
            width: 500,
            child: Image.asset(
              'assets/images/onboarding.png',
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 370,
                  height: 330,
                  child: Column(
                    children: [
                      Text(
                        'Fall in Love with Coffee in Blissful Delight!',
                        style: AppStyle.soraw600White,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                        style: AppStyle.soraw400Gray,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: 370,
                        height: 60,
                        child: PrimaryButton(
                          name: 'Get Started',
                          onPressed: () => Get.offAllNamed(RoutesName.homeView),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
