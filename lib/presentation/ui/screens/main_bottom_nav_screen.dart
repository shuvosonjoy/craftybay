import 'package:craftybay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craftybay/presentation/ui/screens/cart_screen.dart';
import 'package:craftybay/presentation/ui/screens/catagories_screen.dart';
import 'package:craftybay/presentation/ui/screens/home_screen.dart';
import 'package:craftybay/presentation/ui/screens/wishlist_screen.dart';
import 'package:craftybay/presentation/ui/utility/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {


  List<Widget>_screen =[
    HomeScreen(),
    CatagoriesScreen(),
    CartScreen(),
    WishListScreen()
  ];




  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(

          body:_screen[controller.currentIndex],


          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            onTap: (index){
            controller.changedIndex(index);
            },
            items:[
              BottomNavigationBarItem(icon: Icon(Icons.home_filled,),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.dashboard,),label: 'Catagories'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,),label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite,),label: 'Wish'),
            ]
          ),

        );
      }
    );
  }
}
