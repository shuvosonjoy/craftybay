import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/presentation/ui/utility/appcolor.dart';
import 'package:flutter/material.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({
    super.key,
    this.height,
  });
  final double? height;

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  ValueNotifier<int> _index = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height ?? 220.0,
            onPageChanged: (index, reason) {
              _index.value = index;
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'text $i',
                    style: TextStyle(fontSize: 20.0),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
        bottom: 10,left: 0,right: 0,
          child: ValueListenableBuilder(
              valueListenable: _index,
              builder: (context, index, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Container(
                        margin: EdgeInsets.all(4),
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          color: i == index
                              ? AppColors.primaryColor
                              : Colors.white,
                          border: Border.all(
                            color: i == index
                                ? AppColors.primaryColor
                                : Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      )
                  ],
                );
              }),
        )
      ],
    );
  }
}
