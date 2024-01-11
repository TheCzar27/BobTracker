import 'package:shared_preferences/shared_preferences.dart';

class Products {
  final String productName;
  final String productDescription;
  final double productPrice;
  final String imageAdd;
  final List<String> categories;
  final int reviews;

  Products(this.productName, this.productDescription, this.productPrice,
      this.imageAdd, this.categories, this.reviews);

}

Future<double> getProductPriceFromPrefs(String productName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getDouble(productName) ?? 0;
}

Future<void> saveProductPriceToPrefs(String productName, double price) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble(productName, price);
}
