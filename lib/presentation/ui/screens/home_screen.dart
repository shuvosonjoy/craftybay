
import 'package:craftybay/presentation/ui/utility/assets_path.dart';
import 'package:craftybay/presentation/ui/widgets/home/circle_icon_button.dart';
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
      appBar:appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 8,),
              SearchTextField,
              const SizedBox(height:16),
              ImageCarouselWidget(),
              const SizedBox(height:16),
              SectionTitle(
                title: 'All Catagories',
                ontapSeeAll: (){

                },
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField get SearchTextField {
    return TextFormField(

              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search,color: Colors.grey,),
                fillColor: Colors.grey.shade200,
                filled: true,
                border:OutlineInputBorder(
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
                errorBorder:OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),

              ),

            );
  }
  AppBar get appBar{
    return AppBar(

      title: Image.asset(AssetsPath.logoNav),
      actions: [
        CircleIconButton(
          iconData: Icons.person,
          ontap: (){

          },
        ),
        const SizedBox(width: 8,),
        CircleIconButton(
          iconData: Icons.call,
          ontap: (){

          },
        ),
        const SizedBox(width: 8,),
        CircleIconButton(
          iconData: Icons.notifications_active_outlined,
          ontap: (){

          },
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key, required this.title, required this.ontapSeeAll,
  });
  final String title;
  final VoidCallback ontapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children:[
        Text(title,style: TextStyle(
          fontSize: 20,fontWeight: FontWeight.w600,
        ),),
        TextButton(onPressed: ontapSeeAll, child: Text('See all')),
      ]
    );
  }
}





