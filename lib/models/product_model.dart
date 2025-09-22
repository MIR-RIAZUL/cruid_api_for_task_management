//
//
// {
// "_id": "68d0422bdd287e3f18a28b28",
// "ProductName": "nur",
// "ProductCode": 2.345678901111111e+22,
// "Img": "weeerwtghnj",
// "Qty": 3,
// "UnitPrice": 2345,
// "TotalPrice": 7035
// },

class ProductModel {
  late String id;
  late String Name;
  late int Code;
  late String image;
  late int quentity;
  late int UnitPrice;
  late int TotalPrice;

  ProductModel.FromJson(Map<String, dynamic> json) {
    id = json['_id'];
    Name = json['ProductName'];
    Code = json['ProductCode'];
    image = json['Img'];
    quentity = json['Qty'];
    UnitPrice = json['UnitPrice'];
    TotalPrice = json['TotalPrice'];
  }
}
