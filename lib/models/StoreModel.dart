class Store {
  final String name;
  final String description;
  final String imageUrl;
  // Add other attributes as needed

  Store({
    required this.name,
    required this.description,
    required this.imageUrl,
    // Initialize other attributes here
  });

  List<Store> getStores() {
    return [
      Store(
        name: "Store 1",
        description: "Description for Store 1",
        imageUrl: 'URL for Store 1 Image',
      ),
      Store(
        name: "Store 2",
        description: "Description for Store 2",
        imageUrl: 'URL for Store 2 Image',
      ),
      // Add more stores with their respective URLs
    ];
  }
}
