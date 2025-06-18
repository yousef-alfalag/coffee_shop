import 'package:coffee_shop/core/controllers/order_controller.dart';
import 'package:coffee_shop/core/utils/app_assets.dart';
import 'package:coffee_shop/core/utils/app_colors.dart';
import 'package:coffee_shop/core/utils/app_style.dart';
import 'package:coffee_shop/core/widgets/custom_nav_bar.dart';
import 'package:coffee_shop/core/widgets/icon_named_button.dart';
import 'package:coffee_shop/core/widgets/primary_button.dart';
import 'package:coffee_shop/features/home/data/models/coffee_model.dart';
import 'package:coffee_shop/test_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderView extends StatelessWidget {
  final CoffeeModel coffeeOrdered;
  const OrderView({super.key, required this.coffeeOrdered});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OrderControllerImp());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 25, right: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomNavBar(title: 'Order'),
              GetBuilder<OrderControllerImp>(
                builder: (_) {
                  return DeliveryPickupTap();
                },
              ),
              DeliveryAddressWidget(),
              CoffeeItem(),
              DiscountSection(),
              PaymentSection(),
              BottomBarSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryPickupTap extends GetView<OrderControllerImp> {
  const DeliveryPickupTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            child: PrimaryButton(
              name: 'Deliver',

              color:
                  controller.isDeliverySelected == false
                      ? AppColors.lightGray
                      : null,
              textColor:
                  controller.isDeliverySelected == false
                      ? AppColors.black
                      : null,
              onPressed: () => controller.selectDeliveryType('delivery'),
              // variant:
              //     controller.isDeliverSelected.value
              //         ? CustomButtonVariant.primary
              //         : CustomButtonVariant.secondary,
              // backgroundColor:
              //     controller.isDeliverSelected.value
              //         ? Color(0xFFC67C4E)
              //         : appTheme.colorFFEDED,
              // textColor:
              //     controller.isDeliverSelected.value
              //         ? appTheme.whiteCustom
              //         : appTheme.colorFF2424,
            ),
          ),
          SizedBox(width: 4),
          Expanded(
            child: PrimaryButton(
              name: 'Pickup',
              onPressed: () => controller.selectDeliveryType('Pickup'),
              color:
                  controller.isDeliverySelected == true
                      ? AppColors.lightGray
                      : null,
              textColor:
                  controller.isDeliverySelected == true
                      ? AppColors.black
                      : null,
              // variant:
              //     controller.isDeliverSelected.value
              //         ? CustomButtonVariant.primary
              //         : CustomButtonVariant.secondary,
              // backgroundColor:
              //     controller.isDeliverSelected.value
              //         ? Color(0xFFC67C4E)
              //         : appTheme.colorFFEDED,
              // textColor:
              //     controller.isDeliverSelected.value
              //         ? appTheme.whiteCustom
              //         : appTheme.colorFF2424,
            ),
          ),
        ],
      ),
    );
  }
}

class DeliveryAddressWidget extends GetView<OrderControllerImp> {
  const DeliveryAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Delivery Address', style: AppStyle.soraw600Black),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Jl. Kpg Sutoyo'),
              SizedBox(height: 4),
              Text('Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.'),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              IconNamedButton(
                name: 'Edit Address',
                icon: Image.asset(Assets.imagesEdit),
                color: AppColors.lightGray,
                textColor: AppColors.black,
                onPressed: () {
                  Get.to(TestView(name: 'Edit Address'));
                },
              ),
              SizedBox(width: 8),
              IconNamedButton(
                name: 'Add Note',
                icon: Image.asset(Assets.imagesNote),
                color: AppColors.lightGray,
                textColor: AppColors.black,
                onPressed: () {
                  Get.to(TestView(name: 'Add Note'));
                },
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}

class CoffeeItem extends StatelessWidget {
  const CoffeeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(color: Colors.white),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(Assets.images2, fit: BoxFit.fill),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Caffe Mocha'),
                SizedBox(height: 4),
                Text('Deep Foam'),
              ],
            ),
          ),

          SizedBox(width: 16),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              SizedBox(width: 16),
              Text(''),
              SizedBox(width: 16),
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            ],
          ),
        ],
      ),
    );
  }
}

class DiscountSection extends StatelessWidget {
  const DiscountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 4,
          color: AppColors.lightGray,
          margin: EdgeInsets.symmetric(vertical: 20),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.gray),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset(Assets.imagesDiscounticon),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      '1 Discount is Applies',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
          ),
          SizedBox(height: 16),
          Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                      ),
                      Text(
                        '\$ 4.53',
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Fee',
                        
                      ),
                      Row(
                        children: [
                          Text(
                            '\$ 2.0',style: AppStyle.soraw400Gray.copyWith(decoration: TextDecoration.lineThrough)),
                          SizedBox(width: 8),
                          Text(
                            '\$ 1.0',
                            style: AppStyle.soraw600Black
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
        ],
      ),
    );
  }
}

class BottomBarSection extends StatelessWidget {
  const BottomBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(Assets.imagesWallet),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            
                                'Cash/Wallet',
                          ),
                          Text(
                            '\$ 5.53',
                          ),
                        ],
                      )),
                
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Icon(Icons.keyboard_arrow_down_outlined,size: 35,),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          SizedBox(
            width: 500,
            child: PrimaryButton(
              name: 'Order',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}