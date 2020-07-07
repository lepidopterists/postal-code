import 'package:test/test.dart';
import 'package:postalcode/postal_address.dart';

void main() {
  group('Address tests', () {
    test('Address using a code from Brasil', () {
      final address = PostalAddress(
          '90619-900',
          'Av. Ipiranga, 6681',
          '',
          'Partenon',
          'Porto Alegre',
          'RS',
          'Brasil');

      expect(address.code, '90619-900');
      expect(address.place, 'Av. Ipiranga, 6681');
      expect(address.complement, '');
      expect(address.district, 'Partenon');
      expect(address.city, 'Porto Alegre');
      expect(address.state, 'RS');
      expect(address.country, 'Brasil');
    });

    test('Address using a code implicitly from Brasil', () {
      final address = PostalAddress.inBrazil(
          '90619-900',
          'Av. Ipiranga, 6681',
          '',
          'Partenon',
          'Porto Alegre',
          'RS');

      expect(address.code, '90619-900');
      expect(address.place, 'Av. Ipiranga, 6681');
      expect(address.complement, '');
      expect(address.district, 'Partenon');
      expect(address.city, 'Porto Alegre');
      expect(address.state, 'RS');
      expect(address.country, 'Brasil');
    });

  });
}
