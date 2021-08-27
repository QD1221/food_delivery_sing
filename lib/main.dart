import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_sing/blocs/autocomplete/autocomplete_bloc.dart';
import 'package:food_delivery_sing/blocs/basket/basket_bloc.dart';
import 'package:food_delivery_sing/blocs/filters/filters_bloc.dart';
import 'package:food_delivery_sing/blocs/geolocation/geolocation_bloc.dart';
import 'package:food_delivery_sing/config/app_router.dart';
import 'package:food_delivery_sing/config/theme.dart';
import 'package:food_delivery_sing/repositories/geolocation/geolocation_repository.dart';
import 'package:food_delivery_sing/repositories/places/places_repository.dart';
import 'package:food_delivery_sing/screens/home/home_screen.dart';

import 'blocs/place/place_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
          create: (_) => GeolocationRepository(),
        ),
        RepositoryProvider<PlacesRepository>(
          create: (_) => PlacesRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => GeolocationBloc(
                  geolocationRepository: context.read<GeolocationRepository>())
                ..add(LoadGeolocation())),
          BlocProvider(
              create: (context) => AutocompleteBloc(
                  placesRepository: context.read<PlacesRepository>())
                ..add(LoadAutoComplete())),
          BlocProvider(
            create: (context) =>
                PlaceBloc(placesRepository: context.read<PlacesRepository>()),
          ),
          BlocProvider(
            create: (context) => FiltersBloc()..add(FilterLoad()),
          ),
          BlocProvider(
            create: (context) => BasketBloc()..add(StartBasket()),
          ),
        ],
        child: MaterialApp(
          title: 'Food Delivery',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomeScreen.routeName,
        ),
      ),
    );
  }
}
