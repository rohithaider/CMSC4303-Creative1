import 'dart:async'; //using it for stream

class CartItemsBloc {
  final cartStreamController = StreamController.broadcast();

  Stream get getStream => cartStreamController.stream; //exposing stream to other classes

  final Map allItems = {
    'shop items': [
      {'name': 'Book', 'price': 10, 'id': 1},
      {'name': 'Pen', 'price': 5, 'id': 2},
      {'name': 'Eraser', 'price': 2, 'id': 3},
      {'name': 'Pensil', 'price': 1, 'id': 4},
      {'name': 'Papers', 'price': 5, 'id': 5},
      {'name': 'Water Bottles', 'price': 13, 'id': 6},
      {'name': 'Flash Drive', 'price': 18, 'id': 7},
      {'name': 'Perfume', 'price': 22, 'id': 8},
      {'name': 'Duck Tape', 'price': 7, 'id': 9},
    ],
    'cart items': []
  };

  void addToCart(item) {
    allItems['shop items'].remove(item);
    allItems['cart items'].add(item);
    cartStreamController.sink.add(allItems);
  }

  void removeFromCart(item) {
    allItems['cart items'].remove(item);
    allItems['shop items'].add(item);
    cartStreamController.sink.add(allItems);
  }

  void dispose() {
    cartStreamController.close(); // closing StreamController
  }
}

final bloc = CartItemsBloc();
