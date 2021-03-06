import 'package:flutter/material.dart';
import 'package:food_delivery_sing/models/restaurant_model.dart';
import 'package:food_delivery_sing/widgets/restaurant_tags.dart';

class RestaurantInformation extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantInformation({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name,
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          SizedBox(
            height: 10,
          ),
          RestaurantTags(
            restaurant: restaurant,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
              '${restaurant.distance}km away - \$${restaurant.deliveryFee} delivery fee',
              style: Theme.of(context).textTheme.bodyText1),
          SizedBox(
            height: 10,
          ),
          Text('Restaurant Information',
              style: Theme.of(context).textTheme.headline5),
          SizedBox(
            height: 5,
          ),
          Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce lacinia venenatis libero, ac laoreet urna. Aliquam a ultrices mauris. Curabitur bibendum ex vel viverra vulputate. Morbi finibus quam eu ultrices varius. Phasellus mattis eros eu lorem accumsan, ac vehicula justo cursus. Morbi ornare cursus elit non luctus. Nullam eu nibh lacus. Aliquam a pharetra nunc. Donec eget laoreet nibh.',
              style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }
}
