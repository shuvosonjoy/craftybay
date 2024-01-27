import 'package:craftybay/presentation/ui/widgets/catagory_items.dart';
import 'package:flutter/material.dart';

class CatagoriesScreen extends StatefulWidget {
  const CatagoriesScreen({super.key});

  @override
  State<CatagoriesScreen> createState() => _CatagoriesScreenState();
}

class _CatagoriesScreenState extends State<CatagoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              ///TODO
            }),
        title: Text(
          'Catagorie Screen',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 100,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 12,
                crossAxisSpacing: 8,
                childAspectRatio: 0.95),
            itemBuilder: (context, index) {
              return FittedBox(
                child: CatagorieItem(),
              );
            }),
      ),
    );
  }
}
