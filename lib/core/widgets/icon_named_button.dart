import 'package:coffee_shop/core/utils/app_colors.dart';
import 'package:coffee_shop/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class IconNamedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final String name;
  final Widget? icon;
  const IconNamedButton({super.key, this.onPressed, required this.name, this.color, this.textColor, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color:color?? AppColors.primaryColor,
        border: Border.all(color: AppColors.gray),
        borderRadius: BorderRadius.circular(30)
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: icon,
            ),
            SizedBox(width: 5,),
            Text(name,style: AppStyle.soraw600White.copyWith(fontSize: 16,color:textColor),),
          ],
        ),
      ),
    );
  }
}