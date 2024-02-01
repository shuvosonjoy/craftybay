import 'package:craftybay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craftybay/presentation/ui/screens/product_list_screen.dart';
import 'package:craftybay/presentation/ui/utility/assets_path.dart';
import 'package:craftybay/presentation/ui/widgets/catagory_items.dart';
import 'package:craftybay/presentation/ui/widgets/home/circle_icon_button.dart';
import 'package:craftybay/presentation/ui/widgets/home/section_title.dart';
import 'package:craftybay/presentation/ui/widgets/home/image_carousel_slider.dart';
import 'package:craftybay/presentation/ui/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              SearchTextField,
              const SizedBox(height: 16),
              ImageCarouselWidget(),
              const SizedBox(height: 16),
              SectionTitle(
                title: 'All Catagories',
                ontapSeeAll: () {
                  Get.find<MainBottomNavController>().changedIndex(1);
                },
              ),
              catagoryLIst,
              SectionTitle(
                title: 'Popular',
                ontapSeeAll: () {
                  Get.to(()=> const ProductListScreen());
                },
              ),
              productList,
              const SizedBox(height: 8),
              SectionTitle(
                title: 'Special',
                ontapSeeAll: () {},
              ),
              productList,
              const SizedBox(height: 8),
              SectionTitle(
                title: 'New',
                ontapSeeAll: () {},
              ),
              productList,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get catagoryLIst {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const CatagorieItem();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  SizedBox get productList {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const  ProductCardItem();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  TextFormField get SearchTextField {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: Image.asset(AssetsPath.logoNav),
      actions: [
        CircleIconButton(
          iconData: Icons.person,
          ontap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          iconData: Icons.call,
          ontap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          iconData: Icons.notifications_active_outlined,
          ontap: () {},
        ),
      ],
    );
  }
}


