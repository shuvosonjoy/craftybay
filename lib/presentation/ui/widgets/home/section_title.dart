import 'package:flutter/material.dart';

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