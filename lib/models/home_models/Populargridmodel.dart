class PopularGrid_Model {
  final String name;
  final String imageUrl;

  PopularGrid_Model({
    required this.name,
    required this.imageUrl,
  });
}

class GridItemsProvider {
  static List<PopularGrid_Model> getItems() {
    return [
      PopularGrid_Model(
        name: "Item 1",
        imageUrl:
            'https://images.unsplash.com/photo-1498654896293-37aacf113fd9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
      ),
      PopularGrid_Model(
        name: "Item 2",
        imageUrl:
            'https://images.unsplash.com/photo-1635363638580-c2809d049eee?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
      ),
      PopularGrid_Model(
        name: "Item 3",
        imageUrl: 'https://your-image-url-3.com',
      ),
      PopularGrid_Model(
        name: "Item 4",
        imageUrl: 'https://your-image-url-4.com',
      ),
    ];
  }
}
