import 'package:coffee_shop/core/utils/app_colors.dart';
import 'package:flutter/widgets.dart';

abstract class AppStyle {
  static TextStyle soraw600White = TextStyle(
    fontFamily: 'Sora',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    fontSize: 38,
    // line-height: 150%;
    /* or 48px */
    // text-align: center;
    letterSpacing: 0.005,

    /* Color Foundation/Surface/White */
    color: AppColors.white,

    /* Inside auto layout */
    // flex: none;
    // order: 0;
    // flex-grow: 0;
  );
  static TextStyle soraw600Black = TextStyle(
    fontFamily: 'Sora',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    // line-height: 150%;
    /* or 48px */
    // text-align: center;
    letterSpacing: 0.005,

    /* Color Foundation/Surface/White */
    color: AppColors.black,

    /* Inside auto layout */
    // flex: none;
    // order: 0;
    // flex-grow: 0;
  );
  static TextStyle soraw400Gray = TextStyle(
    // height: 42,
    fontFamily: 'Sora',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    // line-height: 150%;
    /* or 48px */
    // text-align: center;
    letterSpacing: 0.001,

    /* Color Foundation/Surface/White */
    color: AppColors.gray,

    /* Inside auto layout */
    // flex: none;
    // order: 0;
    // flex-grow: 0;
  );
}
