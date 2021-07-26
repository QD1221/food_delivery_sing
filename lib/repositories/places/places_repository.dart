import 'package:food_delivery_sing/models/place_autocomplete_model.dart';
import 'package:food_delivery_sing/models/place_model.dart';
import 'package:food_delivery_sing/repositories/places/base_places_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesRepository extends BasePlacesRepository {
  final String key = 'AIzaSyCMHuoIN3nZCku-0zdnG-Qo6vqqcUoQ3ag';
  final String types = 'geocode';

  Future<List<PlaceAutoComplete>> getAutocomplete(String searchInput) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['predictions'] as List;

    return results.map((place) => PlaceAutoComplete.fromJson(place)).toList();
  }

  @override
  Future<Place> getPlace(String placeId) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['results'] as Map<String, dynamic>;

    return Place.fromJson(results);
  }
}
