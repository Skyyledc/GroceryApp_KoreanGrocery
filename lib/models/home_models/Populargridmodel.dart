import 'package:cloud_firestore/cloud_firestore.dart';

class PopularGrid_Model {
  final String storeId;
  final String name;
  final String imageUrl;
  final double storeRating;
  final double storeDistance;

  PopularGrid_Model({
    required this.storeId,
    required this.name,
    required this.imageUrl,
    required this.storeRating,
    required this.storeDistance,
  });
}

class GridItemsProvider {
  static Future<List<PopularGrid_Model>> getItemsFromFirestore() async {
    final QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('gridCategories').get();
    return querySnapshot.docs.map((doc) {
      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return PopularGrid_Model(
        storeId: doc.id,
        name: data['name'],
        imageUrl: data['imageUrl'],
        storeRating: (data['storeRating'] as num).toDouble(),
        storeDistance: (data['storeDistance'] as num).toDouble(),
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
