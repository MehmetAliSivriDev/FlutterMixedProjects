class Product {
  late int id;
  late int categoryId;
  late String productName;
  late double unitPrice;
  late int unitAge;
  late String unitImage;

  Product(this.id, this.categoryId, this.productName, this.unitPrice,
      this.unitAge, this.unitImage);

  Product.fromJson(Map json) {
    id = json["id"];
    categoryId = json["categoryId"];
    productName = json["productName"];
    unitPrice = double.tryParse(json["unitPrice"].toString())!;
    unitAge = json["unitAge"];
    unitImage = json["unitImage"];
  }

  Map toJson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "productNmae": productName,
      "unitPrice": unitPrice,
      "unitAge": unitAge,
      "unitImage": unitImage,
    };
  }
}
