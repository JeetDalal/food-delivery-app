import 'dart:developer';

import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cart = [];
  String _restId = "";
  String _cartRestId = "";
  List<Map<String, dynamic>> get cart {
    return [..._cart];
  }

  String get restId {
    return _restId;
  }

  List<String> get keys {
    List<String> allKeys = [];
    for (int i = 0; i < _cart.length; i++) {
      allKeys.add(_cart[i]['id']);
    }
    log(allKeys.toString());
    return allKeys;
  }

  setRestId(restId) {
    _restId = restId;
    notifyListeners();
  }

  String get cartRestId {
    return _cartRestId;
  }

  setCartRestId(restId) {
    _cartRestId = restId;
    notifyListeners();
  }

  double get price {
    return 0;
  }

  removeItemFromCart(id) {
    for (int i = 0; i < _cart.length; i++) {
      // log(_cart[i]['id']);
      // log(id);
      if (_cart[i]['id'] == id) {
        if (_cart[i]['quantity'] <= 1) {
          _cart.removeWhere((element) => element['id'] == id);
        } else {
          _cart[i].update('quantity', (val) => val - 1);
        }
        break;
      }
    }
    notifyListeners();
  }

  addItemToCart(String id, String name, int price, String imageUrl) {
    if (_restId != _cartRestId) {
      _cart.clear();
    }
    bool _isPresent = false;

    if (_cart.isNotEmpty) {
      for (int i = 0; i < _cart.length; i++) {
        // log(_cart[i]['id']);
        // log(id);
        if (_cart[i]['id'] == id) {
          _cart[i].update('quantity', (val) => val + 1);
          _isPresent = true;
          break;
        }
      }
    }
    if (!_isPresent || _cart.isEmpty) {
      _cart.add({
        'id': id,
        'itemName': name,
        'price': price,
        'imageUrl': imageUrl,
        'quantity': 1
      });
    }
    notifyListeners();
    log(_cart.toString());
  }
}
