class StoreInfo {
  final String storeId;
  final String storeName;
  final String imageUrl;
  final double storeRating;
  final double storeDistance;

  StoreInfo({
    required this.storeId,
    required this.storeName,
    required this.imageUrl,
    required this.storeRating,
    required this.storeDistance,
  });

  StoreInfo.empty()
      : storeId = '',
        storeName = '',
        imageUrl = '',
        storeRating = 0.0,
        storeDistance = 0.0;
}
