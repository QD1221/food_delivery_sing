import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_sing/blocs/filters/filters_bloc.dart';
import 'package:food_delivery_sing/models/models.dart';
import 'package:food_delivery_sing/widgets/custom_category_filter.dart';
import 'package:food_delivery_sing/widgets/custom_price_filter.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  static const String routeName = '/filter';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => FilterScreen(),
      settings: RouteSettings(
        name: routeName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<FiltersBloc, FiltersState>(
                builder: (context, state) {
                  if (state is FiltersLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is FiltersLoaded) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(),
                          padding: const EdgeInsets.symmetric(horizontal: 50)),
                      onPressed: () {
                        var categories = state.filter.categoryFilters
                            .where((filter) => filter.value)
                            .map((filter) => filter.category.name)
                            .toList();

                        var prices = state.filter.priceFilters
                            .where((filter) => filter.value)
                            .map((filter) => filter.price.price)
                            .toList();

                        List<Restaurant> restaurants = Restaurant.restaurants
                            .where((restaurant) => categories.any((category) =>
                                restaurant.tags.contains(category)))
                            .where((restaurant) => prices.any((price) =>
                                restaurant.priceCategory.contains(price)))
                            .toList();

                        Navigator.pushNamed(
                          context,
                          '/restaurant-listing',
                          arguments: restaurants,
                        );
                      },
                      child: Text(
                        'Apply',
                      ),
                    );
                  } else {
                    return Text('Something went wrong!');
                  }
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            CustomPriceFilter(),
            Text(
              'Category',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            CustomCategoryFilter(),
          ],
        ),
      ),
    );
  }
}
