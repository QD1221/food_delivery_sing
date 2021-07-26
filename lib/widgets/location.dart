import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_sing/blocs/autocomplete/autocomplete_bloc.dart';
import 'package:food_delivery_sing/blocs/place/place_bloc.dart';

import 'location_search_box.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 20,
      right: 20,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/logo.svg',
              height: 50,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  LocationSearchBox(),
                  BlocBuilder<AutocompleteBloc, AutocompleteState>(
                      builder: (context, state) {
                    if (state is AutocompleteLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is AutocompleteLoaded) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        height: 300,
                        color: state.autocomplete.length > 0
                            ? Colors.black.withOpacity(0.6)
                            : Colors.transparent,
                        child: ListView.builder(
                          itemCount: state.autocomplete.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(
                                state.autocomplete[index].description,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white),
                              ),
                              onTap: () {
                                context.read<PlaceBloc>().add(LoadPlace(
                                    placeId:
                                        state.autocomplete[index].placeId));
                              },
                            );
                          },
                        ),
                      );
                    } else {
                      return Text('Something went wrong!');
                    }
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
