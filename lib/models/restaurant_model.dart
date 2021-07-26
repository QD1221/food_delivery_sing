import 'package:equatable/equatable.dart';

import 'menu_item_model.dart';

class Restaurant extends Equatable {
  final int id;
  final String imageUrl;
  final String name;
  final List<String> tags;
  final List<MenuItem> menuItems;
  final int deliveryTime;
  final String priceCategory;
  final double deliveryFee;
  final double distance;

  Restaurant({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.tags,
    required this.menuItems,
    required this.deliveryTime,
    required this.priceCategory,
    required this.deliveryFee,
    required this.distance,
  });

  @override
  List<Object?> get props => [
        id,
        imageUrl,
        name,
        tags,
        deliveryTime,
        priceCategory,
        deliveryFee,
        distance,
      ];

  static List<Restaurant> restaurants = [
    Restaurant(
      id: 1,
      imageUrl:
          'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',
      name: 'Golden Gate',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 1)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 1)
          .toList(),
      deliveryTime: 30,
      priceCategory: '\$',
      deliveryFee: 1.99,
      distance: 0.1,
    ),
    Restaurant(
      id: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',
      name: 'Golden Gate 2',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 2)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 2)
          .toList(),
      deliveryTime: 30,
      priceCategory: '\$',
      deliveryFee: 1.99,
      distance: 0.1,
    ),
    Restaurant(
      id: 3,
      imageUrl:
          'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',
      name: 'Golden Gate 3',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 3)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 3)
          .toList(),
      deliveryTime: 30,
      priceCategory: '\$',
      deliveryFee: 1.99,
      distance: 0.1,
    ),
    Restaurant(
      id: 4,
      imageUrl:
          'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',
      name: 'Golden Gate 4',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 4)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 4)
          .toList(),
      deliveryTime: 30,
      priceCategory: '\$',
      deliveryFee: 1.99,
      distance: 0.1,
    ),
    Restaurant(
      id: 5,
      imageUrl:
          'https://images.unsplash.com/photo-1552566626-52f8b828add9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      name: 'Red Gate',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 5)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 5)
          .toList(),
      deliveryTime: 30,
      priceCategory: '\$',
      deliveryFee: 1.99,
      distance: 0.1,
    ),
  ];
}
