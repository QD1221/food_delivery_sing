import 'package:flutter/material.dart';
import 'package:food_delivery_sing/models/restaurant_model.dart';
import 'package:food_delivery_sing/screens/basket/basket_screen.dart';
import 'package:food_delivery_sing/screens/checkout/checkout_screen.dart';
import 'package:food_delivery_sing/screens/delivery_time/delivery_time_screen.dart';
import 'package:food_delivery_sing/screens/filter/filter_screen.dart';
import 'package:food_delivery_sing/screens/home/home_screen.dart';
import 'package:food_delivery_sing/screens/location/location_screen.dart';
import 'package:food_delivery_sing/screens/restaurant_details/restaurant_details_screen.dart';
import 'package:food_delivery_sing/screens/restaurant_listing/restaurant_listing_screen.dart';
import 'package:food_delivery_sing/screens/voucher/voucher_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is: ${settings.name}');
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case FilterScreen.routeName:
        return FilterScreen.route();
      case RestaurantDetailsScreen.routeName:
        return RestaurantDetailsScreen.route(
            restaurant: settings.arguments as Restaurant);
      case RestaurantListingScreen.routeName:
        return RestaurantListingScreen.route(
            restaurants: settings.arguments as List<Restaurant>);
      case VoucherScreen.routeName:
        return VoucherScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('error'),
        ),
      ),
      settings: RouteSettings(
        name: '/error',
      ),
    );
  }
}
