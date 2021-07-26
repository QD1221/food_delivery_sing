import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_sing/models/place_autocomplete_model.dart';
import 'package:food_delivery_sing/repositories/places/places_repository.dart';

part 'autocomplete_event.dart';
part 'autocomplete_state.dart';

class AutocompleteBloc extends Bloc<AutocompleteEvent, AutocompleteState>{
  final PlacesRepository _placesRepository;
  StreamSubscription? _placesSubscription;

  AutocompleteBloc({required placesRepository}) : _placesRepository = placesRepository,
        super(AutocompleteLoading());

  @override
  Stream<AutocompleteState> mapEventToState(AutocompleteEvent event) async*{
    if(event is LoadAutoComplete){
      yield* _mapLoadAutocompleteToState(event);
    }
  }

  Stream<AutocompleteState> _mapLoadAutocompleteToState(
      LoadAutoComplete event) async* {
    _placesSubscription?.cancel();

    final List<PlaceAutoComplete> autocomplete =
        await _placesRepository.getAutocomplete(event.searchInput);

    yield AutocompleteLoaded(autocomplete: autocomplete);
  }

}