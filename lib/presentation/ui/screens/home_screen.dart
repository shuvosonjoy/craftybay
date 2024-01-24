import 'package:craftybay/presentation/ui/utility/appcolor.dart';
import 'package:craftybay/presentation/ui/utility/assets_path.dart';
import 'package:craftybay/presentation/ui/widgets/catagory_items.dart';
import 'package:craftybay/presentation/ui/widgets/home/circle_icon_button.dart';
import 'package:craftybay/presentation/ui/widgets/home/section_title.dart';
import 'package:craftybay/presentation/ui/widgets/image_carousel_slider.dart';
import 'package:flutter/material.dart';

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
                ontapSeeAll: () {},
              ),
              catagoryLIst,
              SectionTitle(
                title: 'Popular',
                ontapSeeAll: () {},
              ),
              popularProductList,
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
          return CatagorieItem(
            title: 'Electronics',
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  SizedBox get popularProductList {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft:Radius.circular(16),
                  ),
                  child: Image.asset(
                    AssetsPath.dummyShoeJpg,
                    width: 120,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("Nike 1600",style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),),
                    ],
                  ),
                ),
              ],
            ),
          );
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
