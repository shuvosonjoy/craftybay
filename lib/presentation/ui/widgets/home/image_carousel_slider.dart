import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/presentation/ui/utility/appcolor.dart';
import 'package:flutter/material.dart';

class ImageCarouselWidget extends StatefulWidget {
  const ImageCarouselWidget({
    super.key, this.height,
  });
  final double? height;

  @override
  State<ImageCarouselWidget> createState() => _ImageCarouselWidgetState();
}

class _ImageCarouselWidgetState extends State<ImageCarouselWidget> {
  ValueNotifier<int>_index = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(

          options: CarouselOptions(

              height: widget.height ?? 180.0,
            onPageChanged: (index, reason){
                _index.value =index;

            }
          ),

          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment:Alignment.center,
                    child: Text('text $i', style: TextStyle(fontSize: 20.0),)
                );
              },
            );
          }).toList(),
        ),
        ValueListenableBuilder(
          valueListenable: _index,
          builder: (context,index,_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i=0;i<5;i++)
                  Container(
                    margin: EdgeInsets.all(4),
                    height: 12,width: 12,
                    decoration: BoxDecoration(
                      color: i==index ? AppColors.primaryColor: Colors.transparent,
                      border: Border.all(
                        color: i==index ? AppColors.primaryColor: Colors.grey.shade400,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )

              ],
            );
          }
        )
      ],
    );
  }
}