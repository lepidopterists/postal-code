import 'package:http/http.dart';
import 'dart:convert';
import 'postal_address.dart';

class PostalAddressProvider {
  Future<PostalAddress> fetchPostalAddress(String code) async {
    Client end_point = Client();
    final response = await end_point.get('http://viacep.com.br/ws/$code/json/');
    if (response.statusCode == 200) {
      return PostalAddress.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load postal address for $code code.');
    }
  }
}
