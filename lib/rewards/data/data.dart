import '../model/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PurchaseManager {
  late int totalPoints;

   PurchaseManager() {
    _loadTotalPoints();
  }

  Future<void> _loadTotalPoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    totalPoints = prefs.getInt('totalPoints') ?? 0;
  }

  Future<void> _saveTotalPoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('totalPoints', totalPoints);
  }

  Future<double> getProductPriceFromPrefs(String productName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('productPrice_$productName') ?? 0;
  }

  Future<void> subtractFromTotalPoints(String productName) async {
    double productPrice = await getProductPriceFromPrefs(productName);
    totalPoints = totalPoints - productPrice.toInt();
    await _saveTotalPoints();
  }

  double calculateTotalPrice(int totalPoints, double productPrice) {
    return totalPoints - productPrice;
  }
}

final List<Products> products = [
  Products(
      'Team Bob T-Shirt',
      'Whether you are looking for a stylish way to show your support for the BOB Tracker app or just want a comfortable and trendy wardrobe staple, this T-Shirt is the perfect choice. With its high-quality construction and stylish design, it is sure to become a favorite in your collection.',
      20,
      'assets/images/BobShirt.png',
      ['New Product'],
      15),
  Products(
      'Gym Membership',
      'Available to all users who wish to join the gyms we are partnered with for one month of membership, this card offers unbeatable value for money, with access to state-of-the-art equipment and tailored workout programs designed by certified personal trainers. With this card, you get unlimited access to the gym and its facilities, including the swimming pool, sauna, and steam room. You can also participate in a variety of group fitness classes, from high-intensity interval training to yoga and pilates.',
      100,
      'assets/images/member-combo.png',
      ['Recommended'],
      34),
  Products(
      'Gift Card',
      'Introducing our exciting new earnable hundred dollar gift card, exclusively available in our app! With this special currency that you can earn within the app, you can redeem it for a gift card of your choice from a wide range of options that cater to all your needs.',
      300,
      'assets/images/gift-card.png',
      ['New Product', 'Popular'],
      3),
  Products(
      'BlueAnt Headphones',
      'With warm & smooth sound, exceptional battery life and comfortable design, entry-level wireless headphones don’t get better than this.',
      150,
      'assets/images/headphones.png',
      ['Popular'],
      67),
];

