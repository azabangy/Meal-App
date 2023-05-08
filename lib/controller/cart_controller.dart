import 'package:get/get.dart';
import '../data/repository/cart_repository.dart';
import '../model/cart_model.dart';
import '../model/product_model.dart';

class CartController extends GetxController {
  CartRepository cartRepository;

  CartController({required this.cartRepository});

  Map<int, CartModel> _items = {};
  List<CartModel> storageItem=[];

  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: value.id!,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExit: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      _items.putIfAbsent(product.id!, () {
        _items.forEach((key, value) {});
        return CartModel(
          id: product.id!,
          name: product.name,
          price: product.price,
          img: product.img,
          quantity: quantity,
          isExit: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });
    }
    cartRepository.addToCartList(getItems);
    update();
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    var quantity = 1;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
      return quantity;
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  get totalPrice{
    var total = 0;
    _items.forEach((key, value) {
      total += value.price! * value.quantity!;
    });
    return total;
  }

  List<CartModel> getCartData(){
    setCart = cartRepository.getCartList();
    return storageItem;
  }

  set setCart(List<CartModel> items){
    storageItem = items;
    for(int i=0;i<storageItem.length;i++){
      _items.putIfAbsent(storageItem[i].product!.id!, () => storageItem[i]);
    }
  }

  void addToHistory (){
    cartRepository.addToCartHistoryList();
    clear();
  }

  void clear(){
    _items ={};
    update();
  }

  List<CartModel> getCartHistoryList(){
    return cartRepository.getCartHistoryList();
  }

  set setItems(Map<int,CartModel> setItem){
    _items={};
    _items.addAll(setItem);
  }

  void addToCartList(){
    cartRepository.addToCartList(getItems);
    update();
  }

  void clearCartHistory(){
    cartRepository.clearCartHistory();
    update();
  }

}
