import 'package:coffee_shop/core/utils/app_colors.dart';
import 'package:coffee_shop/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final String name;
  const PrimaryButton({super.key, this.onPressed, required this.name, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:color?? AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16)
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(name,style: AppStyle.soraw600White.copyWith(fontSize: 16,color:textColor),),
      ),
    );
  }
}