import 'package:flutter/material.dart';
import 'package:food_delivery_sing/models/models.dart';

class RestaurantTags extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantTags({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: restaurant.tags
            .map((tag) =>
                restaurant.tags.indexOf(tag) == restaurant.tags.length - 1
                    ? Text(
                        tag,
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    : Text(
                        '$tag, ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ))
            .toList());
  }
}
