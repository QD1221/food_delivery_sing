import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_sing/blocs/geolocation/geolocation_bloc.dart';
import 'package:food_delivery_sing/blocs/place/place_bloc.dart';
import 'package:food_delivery_sing/widgets/gmap.dart';
import 'package:food_delivery_sing/widgets/location.dart';
import 'package:food_delivery_sing/widgets/save_button.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  static const String routeName = '/location';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => LocationScreen(),
      settings: RouteSettings(
        name: routeName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<PlaceBloc, PlaceState>(builder: (context, state) {
        if (state is PlaceLoading) {
          return Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: BlocBuilder<GeolocationBloc, GeolocationState>(
                  builder: (context, state) {
                    if (state is GeolocationLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GeolocationLoaded) {
                      return Gmap(
                        lat: state.position.latitude,
                        lng: state.position.longitude,
                      );
                    } else {
                      return Text('Something went wrong!');
                    }
                  },
                ),
              ),
              SaveButton(),
              Location(),
            ],
          );
        } else if (state is PlaceLoaded) {
          return Stack(
            children: [
              Gmap(
                lat: state.place.lat,
                lng: state.place.lng,
              ),
              SaveButton(),
              Location(),
            ],
          );
        } else {
          return Text('Something went wrong!');
        }
      }),
    );
  }
}
