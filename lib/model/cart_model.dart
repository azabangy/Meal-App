import 'package:al_waha/model/product_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExit;
  String? time;
  ProductModel? product;


  CartModel(
      {this.id,
        this.name,
        this.price,
        this.img,
        this.quantity,
        this.isExit,
        this.time,
        this.product
        });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity =json['quantity'];
    isExit = json['IsExit'];
    time = json['time'];
    product=ProductModel.fromJson(json['product']);
  }

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'name': name,
      'price':price,
      'img':img,
      'quantity':quantity,
      'isExit':isExit,
      'time':time,
      'product':product!.toJson(),
    };
  }


}