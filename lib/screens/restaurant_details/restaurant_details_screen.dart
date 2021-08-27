import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_sing/blocs/basket/basket_bloc.dart';
import 'package:food_delivery_sing/models/models.dart';
import 'package:food_delivery_sing/widgets/restaurant_information.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({Key? key, required this.restaurant})
      : super(key: key);

  static const String routeName = '/restaurant-detail';

  static Route route({required Restaurant restaurant}) {
    return MaterialPageRoute(
      builder: (_) => RestaurantDetailsScreen(restaurant: restaurant),
      settings: RouteSettings(
        name: routeName,
      ),
    );
  }

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(),
                      padding: const EdgeInsets.symmetric(horizontal: 50)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/basket');
                  },
                  child: Text(
                    'Basket',
                  ),
                ),
              ],
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      restaurant.imageUrl,
                    ),
                  ),
                ),
              ),
              RestaurantInformation(restaurant: restaurant),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: restaurant.tags.length,
                  itemBuilder: (context, index) {
                    return _buildMenuItems(restaurant, context, index);
                  })
            ],
          ),
        ));
  }

  Widget _buildMenuItems(
      Restaurant restaurant, BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            restaurant.tags[index],
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
        Column(
          children: restaurant.menuItems
              .where((menuItem) => menuItem.category == restaurant.tags[index])
              .map(
                (menuItem) => Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          menuItem.name,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        subtitle: Text(
                          menuItem.description,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '\$${menuItem.price}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            BlocBuilder<BasketBloc, BasketState>(
                              builder: (context, state) {
                                return IconButton(
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    context.read<BasketBloc>()
                                      ..add(AddItem(menuItem));
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 2,
                    )
                  ],
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
