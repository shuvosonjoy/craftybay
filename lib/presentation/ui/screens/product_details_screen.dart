import 'package:craftybay/presentation/ui/utility/appcolor.dart';
import 'package:craftybay/presentation/ui/widgets/product_details/color_selector.dart';
import 'package:craftybay/presentation/ui/widgets/product_details/product_carousel_slider.dart';
import 'package:craftybay/presentation/ui/widgets/product_details/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ValueNotifier<int> noOfItems = ValueNotifier(1);
  Color _selectedColor = Colors.grey;
  List<Color> colors = [
    Colors.grey,
    Colors.red,
    Colors.black,
    Colors.amber,
    Colors.green
  ];
  List<String> sizes = ['L', 'M', 'XL', 'XXL', 'XXXL'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ProductImageCarousel(), productDetailsBody],
                ),
              ),
            ),
            priceAndAddToCartSection,
          ],
        ));
  }

  Padding get productDetailsBody {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Nike Sports Shoe 2024 Edition - save 30%',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: noOfItems,
                builder: (context, value, _) {
                  return ItemCount(
                    initialValue: value,
                    minValue: 1,
                    maxValue: 10,
                    decimalPlaces: 0,
                    step: 1,
                    color: AppColors.primaryColor,
                    onChanged: (v) {
                      noOfItems.value = v.toInt();
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          reviewAndRating,
          SizedBox(
            height: 16,
          ),
          Text(
            'Colors',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          ColorSelector(
              colors: colors,
              onChange: (selectedColor) {
                _selectedColor = selectedColor;
              }),
          SizedBox(
            height: 16,
          ),
          Text(
            'Size',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizeSelector(sizes: sizes, onChange: (s) {}),
          SizedBox(
            height: 8,
          ),
          Text(
            'Description',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Introducing the epitome of style and comfort, our cutting-edge shoes seamlessly blend fashion and function. Crafted with precision and passion, each pair reflects a perfect synergy of form and substance. Immerse yourself in unparalleled luxury as you step into a world where every detail is meticulously designed. From the plush insoles to the durable outsoles, our shoes redefine sophistication. Elevate your stride with innovative materials that embrace your feet in a gentle embrace. Whether you\'re navigating city streets or dancing under starlit skies, these shoes are more than footwear—they\'re an expression of your unique journey. Walk confidently, embracing a fusion of elegance and resilience.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Row get reviewAndRating {
    return Row(
          children: [
            Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
              Icon(
                Icons.star,
                size: 18,
                color: Colors.amber,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '4.4',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ]),
            SizedBox(
              width: 8,
            ),
            Text(
              'Reviews',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Card(
              color: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.favorite_border_rounded,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            )
          ],
        );
  }

  Container get priceAndAddToCartSection {
    return Container(
      padding: const EdgeInsets.all(10),
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
                'Price',
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
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          )
        ],
      ),
    );
  }
}
