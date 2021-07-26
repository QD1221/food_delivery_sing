import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String category;
  final String description;
  final double price;

  MenuItem({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [
        id,
        restaurantId,
        name,
        category,
        description,
        price,
      ];

  static List<MenuItem> menuItems = [
    MenuItem(
      id: 1,
      restaurantId: 1,
      name: 'Pizza Hut',
      category: 'Pizza',
      description: 'Pizza with Tomatoes',
      price: 4.99,
    ),
    MenuItem(
      id: 2,
      restaurantId: 1,
      name: 'Pepsi',
      category: 'Juice',
      description: 'A cold beverage',
      price: 1.99,
    ),
    MenuItem(
      id: 3,
      restaurantId: 1,
      name: 'Pizza Hut 3',
      category: 'Pizza',
      description: 'Pizza with Tomatoes',
      price: 4.99,
    ),
    MenuItem(
      id: 4,
      restaurantId: 1,
      name: 'Pepsi 4',
      category: 'Juice',
      description: 'A cold beverage',
      price: 1.99,
    ),
    MenuItem(
      id: 5,
      restaurantId: 1,
      name: 'Pizza Hut 5',
      category: 'Pizza',
      description: 'Pizza with Tomatoes',
      price: 4.99,
    ),
    MenuItem(
      id: 6,
      restaurantId: 2,
      name: 'Ice Avocado',
      category: 'Avocado',
      description: 'Avocado with ice',
      price: 10.99,
    ),
  ];
}
