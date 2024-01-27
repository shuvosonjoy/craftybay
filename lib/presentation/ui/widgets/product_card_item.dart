import 'package:craftybay/presentation/ui/utility/appcolor.dart';
import 'package:craftybay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: 160,
      child: Card(
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
                width: 160,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nike shoe 1600 2024 Edition",maxLines:1,overflow: TextOverflow.ellipsis,style: TextStyle(

                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),),
                  Row(
                      children:[
                        Text('\$120',style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),),
                        SizedBox(width: 10,),
                        Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children:[
                              Icon(Icons.star,size: 14,color: Colors.amber,),
                              Text('4.4',style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54
                              ),),
                            ]
                        ),
                        SizedBox(width: 8,),
                        Card(
                          color: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(Icons.favorite_border_rounded,size: 10,color: Colors.white,),
                          ),
                        )
                      ]
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}