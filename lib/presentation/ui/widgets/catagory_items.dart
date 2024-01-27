import 'package:craftybay/presentation/ui/utility/appcolor.dart';
import 'package:flutter/material.dart';

class CatagorieItem extends StatelessWidget {
  const CatagorieItem({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          color: AppColors.primaryColor.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              Icons.computer,
              size: 32,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        Text(
          'Electronics' ?? '',
          style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}