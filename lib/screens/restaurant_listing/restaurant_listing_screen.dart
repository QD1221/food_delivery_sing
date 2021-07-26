import 'package:flutter/material.dart';
import 'package:food_delivery_sing/models/models.dart';
import 'package:food_delivery_sing/widgets/restaurant_card.dart';

class RestaurantListingScreen extends StatelessWidget {
  const RestaurantListingScreen({Key? key, required this.restaurants})
      : super(key: key);

  static const String routeName = '/restaurant-listing';

  static Route route({required List<Restaurant> restaurants}) {
    return MaterialPageRoute(
      builder: (_) => RestaurantListingScreen(
        restaurants: restaurants,
      ),
      settings: RouteSettings(
        name: routeName,
      ),
    );
  }

  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            return RestaurantCard(restaurant: restaurants[index]);
          },
        ),
      ),
    );
  }
}
