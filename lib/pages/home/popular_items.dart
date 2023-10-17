import 'package:flutter/material.dart';
import 'package:groceryapp/models/home_models/Populargridmodel.dart';

class PopularItemsHome extends StatefulWidget {
  const PopularItemsHome({super.key});

  @override
  State<PopularItemsHome> createState() => _PopularItemsHomeState();
}

class _PopularItemsHomeState extends State<PopularItemsHome> {
  List<PopularGrid_Model> items = GridItemsProvider.getItems();

  void _onGridItemTapped(String itemName) {
    print("Tapped item name: $itemName");
  }

  Widget buildGridItem(PopularGrid_Model item) {
    return GestureDetector(
      onTap: () {
        _onGridItemTapped(item.name);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Image.network(
          item.imageUrl,
          width: 300,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 1,
        ),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return buildGridItem(items[index]);
        },
      ),
    );
  }
}
