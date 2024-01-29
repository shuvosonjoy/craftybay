import 'package:craftybay/presentation/ui/widgets/product_details/product_carousel_slider.dart';
import 'package:flutter/material.dart';


class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(),
      body: Column(
        children: [
          ProductImageCarousel(),
        ],
      )
    );
  }



}


