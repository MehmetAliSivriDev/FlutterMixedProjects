import 'package:bloc_pattern_denemesi/models/cart.dart';

class CartService {
  static List<Cart> cartItems = <Cart>[];
  static CartService _cartSingleton = CartService._internal();

  CartService._internal();

  factory CartService() {
    return _cartSingleton;
  }

  static void addCart(Cart item) {
    cartItems.add(item);
  }

  static void removeFromCart(Cart item) {
    cartItems.remove(item);
  }

  static List<Cart> getCart() {
    return cartItems;
  }
}
