import 'package:flutter/material.dart';
import 'package:groceryapp/models/home_models/populargridmodel.dart';
import 'package:groceryapp/models/StoreModel.dart';
import 'package:groceryapp/pages/store/store_stack.dart';
import 'package:groceryapp/pages/store/store_page.dart';

class PopularItemsHome extends StatefulWidget {
  const PopularItemsHome({Key? key}) : super(key: key);

  @override
  State<PopularItemsHome> createState() => _PopularItemsHomeState();
}

class _PopularItemsHomeState extends State<PopularItemsHome> {
  List<PopularGrid_Model> items = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromFirestore();
  }

  void fetchDataFromFirestore() {
    GridItemsProvider.getItemsFromFirestore().then((storeData) {
      setState(() {
        items = storeData;
      });
    });
  }

  void onGridItemTapped(PopularGrid_Model item) {
    StoreInfo storeInfo = StoreInfo(
      storeId: item.storeId, // Use the storeId from the grid item
      storeName: item.name, // Use the store name from the grid item
      imageUrl: item.imageUrl,
      storeRating: item.storeRating.toDouble(),
      storeDistance: item.storeDistance.toDouble(),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            StorePage(storeId: item.storeId), // Pass storeId as an argument
      ),
    );
  }

  Widget buildGridItem(PopularGrid_Model item) {
    return GestureDetector(
      onTap: () {
        onGridItemTapped(item);
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
