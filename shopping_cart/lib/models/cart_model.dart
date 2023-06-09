class  Cart {

  late final int? id;
  final String? productId;
  final String? productName;
  final int? initialPrice;
  final int? price;
  final int? quantity;
  final String? productUnits;
  final String? productImage;


  Cart
      ({
    required  this.id,
    required  this.productId ,
    required  this.productName,
    required  this.initialPrice,
    required  this.price,
    required  this.quantity,
    required  this.productUnits,
    required  this.productImage,
  });

  Cart.fromMap(Map<dynamic,dynamic> res)
  : id = res ['id'],
  productId = res ["productId"],
  productName = res["productName"],
  initialPrice = res ["initialPrice"],
  price = res ["price"],
  quantity = res ["quantity"],
  productUnits = res ["productUnits"],
  productImage = res ["productImage"];


  Map<String,Object?> toMap()
  {
  return
    {
      "id": id,
      "productId": productId,
      "productName": productName,
      "initialPrice": initialPrice,
      "price": price,
      "quantity": quantity,
      "productUnits": productUnits,
      "productImage": productImage,
    };

  }

}
