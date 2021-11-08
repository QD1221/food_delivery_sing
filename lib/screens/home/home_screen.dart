import 'package:flutter/material.dart';
import 'package:food_delivery_sing/models/category_model.dart';
import 'package:food_delivery_sing/models/models.dart';
import 'package:food_delivery_sing/models/promo_model.dart';
import 'package:food_delivery_sing/widgets/category_box.dart';
import 'package:food_delivery_sing/widgets/custom_appbar.dart';
import 'package:food_delivery_sing/widgets/food_search_box.dart';
import 'package:food_delivery_sing/widgets/promo_box.dart';
import 'package:food_delivery_sing/widgets/restaurant_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(),
      settings: RouteSettings(
        name: routeName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: Category.categories.length,
                    itemBuilder: (context, index) {
                      return CategoryBox(category: Category.categories[index]);
                    }),
              ),
            ),
            FoodSearchBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 125,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: Promo.promos.length,
                    itemBuilder: (context, index) {
                      return PromoBox(
                        promo: Promo.promos[index],
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Top Rated',
                    style: Theme.of(context).textTheme.headline4,
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: Restaurant.restaurants.length,
                    itemBuilder: (context, index) {
                      return RestaurantCard(
                          restaurant: Restaurant.restaurants[index]);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
