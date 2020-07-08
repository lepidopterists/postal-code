import 'package:postalcode/postal_address_provider.dart';
import 'package:test/test.dart';
import 'dart:convert';
import 'package:postalcode/postal_address.dart';

void main() {
  group('Address Provider tests', ()
  {
    test('Address using a code from Brasil', () async {
      PostalAddressProvider provider = PostalAddressProvider();
      PostalAddress actual_address = await provider.fetchPostalAddress('90619-900');

      expect(actual_address.code, '90619-900');
      expect(actual_address.place, 'Avenida Ipiranga 6681');
      expect(actual_address.complement, '');
      expect(actual_address.district, 'Partenon');
      expect(actual_address.city, 'Porto Alegre');
      expect(actual_address.state, 'RS');
      expect(actual_address.country, 'Brasil');
    });
  });
}
