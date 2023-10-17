import 'package:cloud_firestore/cloud_firestore.dart';

class PopularGrid_Model {
  final String name;
  final String imageUrl;

  PopularGrid_Model({
    required this.name,
    required this.imageUrl,
  });
}

class GridItemsProvider {
  static Future<List<PopularGrid_Model>> getItemsFromFirestore() async {
    final QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('gridCategories').get();
    return querySnapshot.docs.map((doc) {
      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return PopularGrid_Model(
        name: data['name'],
        imageUrl: data['imageUrl'],
      );
    }).toList();
  }
}

// Usage example
// You can use this class in your widget or wherever needed.
class _PopularItemsHomeState {
  List<PopularGrid_Model> items = [];

  void fetchDataFromFirestore() {
    GridItemsProvider.getItemsFromFirestore().then((storeData) {
      items = storeData;
    });
  }
}
