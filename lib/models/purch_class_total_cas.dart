import 'package:in_app_purchase/in_app_purchase.dart';

enum TotalCasProductStatus {
  purchasable,
  purchased,
  pending,
}

class PurchClassTotalCas {
  String get id => productDetails.id;
  String get title => productDetails.title;
  String get description => productDetails.description;
  String get price => productDetails.price;
  TotalCasProductStatus status;
  ProductDetails productDetails;
  PurchClassTotalCas(this.productDetails)
      : status = TotalCasProductStatus.purchasable;
}
