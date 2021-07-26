import 'package:equatable/equatable.dart';

class Promo extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  Promo({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        imageUrl,
      ];

  static List<Promo> promos = [
    Promo(
      id: 1,
      title: 'FREE Delivery on Your First 3 Orders.',
      description:
          'Place an order of \$10 or more and the delivery fee is on us',
      imageUrl:
          'https://images.unsplash.com/photo-1511690656952-34342bb7c2f2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZvb2QlMjBwcm9tb3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    ),
    Promo(
      id: 2,
      title: '20% OFF on Selected Restaurants.',
      description:
          'Get a discount at more than 200+ restaurants',
      imageUrl:
          'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGZvb2QlMjBwcm9tb3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    )
  ];
}
