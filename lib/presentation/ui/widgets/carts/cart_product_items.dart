import 'package:craftybay/presentation/ui/utility/appcolor.dart';
import 'package:craftybay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CardProductItems extends StatefulWidget {
  const CardProductItems({super.key});

  @override
  State<CardProductItems> createState() => _CardProductItemsState();
}

class _CardProductItemsState extends State<CardProductItems> {
  ValueNotifier<int> noOfItems = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Row(
        children: [
          Image.asset(
            AssetsPath.dummyShoeJpg,
            width: 100,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nike shoe 1234 2asdfasdfads021 Edition',
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Text('Color: Red'),
                              SizedBox(
                                width: 8,
                              ),
                              Text('Size: XL'),
                            ],
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '\$10000',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}