import 'package:food_delivery_sing/models/place_autocomplete_model.dart';
import 'package:food_delivery_sing/models/place_model.dart';

abstract class BasePlacesRepository {
  Future<List<PlaceAutoComplete>?> getAutocomplete(String searchInput) async {

  }
  Future<Place?> getPlace(String placeId) async {

  }
}