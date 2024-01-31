import 'package:craftybay/presentation/ui/utility/appcolor.dart';
import 'package:craftybay/presentation/ui/widgets/product_details/product_carousel_slider.dart';
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
  List<String>sizes = [
    'L','M','XL','XXL','XXXL'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageCarousel(),
                  Padding(
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
                        Row(
                          children: [
                            Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Colors.amber,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '4.4',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
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
                        ),
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
                        ColorSelector(colors: colors, onChange:(selectedColor){
                          _selectedColor=selectedColor;
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
                        SizedBox(
                          height: 8,
                        ),
                        SizeSelector(sizes: sizes, onChange: (s){})

                      ],
                    ),
                  )
                ],
              ),
            ),
            priceAndAddToCartSection,
          ],
        ));
  }

  Container get priceAndAddToCartSection {
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
class ColorSelector extends StatefulWidget {
  const ColorSelector({super.key, required this.colors, required this.onChange});
  final List<Color> colors;
  final Function(Color) onChange;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  late Color _selectedColor ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedColor=widget.colors.first;

  }

  @override
  Widget build(BuildContext context) {
    return  Row(
        children: widget.colors
            .map((c) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              _selectedColor = c;
              widget.onChange(c);
              if (mounted) {
                setState(() {});
              }
            },
            child: CircleAvatar(
              backgroundColor: c,
              radius: 15,
              child: _selectedColor == c
                  ? Icon(
                Icons.done,
                color: Colors.white,
              )
                  : null,
            ),
          ),
        ))
            .toList());
  }
}




class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key, required this.sizes, required this.onChange});
  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  late String _selectedSize ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedSize=widget.sizes.first;

  }

  @override
  Widget build(BuildContext context) {
    return  Row(
        children: widget.sizes
            .map((c) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              _selectedSize = c;
              widget.onChange(c);
              if (mounted) {
                setState(() {});
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey),
                color: _selectedSize ==c ? AppColors.primaryColor : null,
              ),
              child: Text(c,style: TextStyle(
                color: _selectedSize == c ? Colors.white : Colors.grey
              ),)

            ),
          ),
        ))
            .toList());
  }
}
