class Cart_Model {
  final String name;
  final double price;

  Cart_Model(this.name, this.price);
}

class Cart {
  final List<Cart_Model> items;

  Cart(this.items);

  double get subtotal {
    return items.fold(0.0, (double sum, item) => sum + item.price);
  }

  double get deliveryFee {
    //Calculate delivery fee here
    return 50.0;
  }

  double get totalAmount {
    return subtotal + deliveryFee;
  }
}
