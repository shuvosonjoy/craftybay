import 'package:craftybay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craftybay/presentation/ui/utility/appcolor.dart';
import 'package:craftybay/presentation/ui/widgets/carts/cart_product_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
          ),
          title: const Text('Cart'),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.separated(
              itemCount: 5,
              itemBuilder: (context, index) {
                return CardProductItems();
              },
              separatorBuilder: (_, __) => SizedBox(
                height: 8,
              ),
            )),
            totalPriceAndCheckSection,
          ],
        ),
      ),
    );
  }

  Container get totalPriceAndCheckSection {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.15),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Price',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '\$12000',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 115,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Check Out'),
            ),
          )
        ],
      ),
    );
  }
}


