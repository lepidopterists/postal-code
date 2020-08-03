// Copyright (c) 2020, the Postal Code project authors.  Please see
// the AUTHORS file for details. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:test/test.dart';

import 'package:postalcode/postal_address.dart';

void main() {
  group('Address tests', () {
    test('Address using a code from Brasil', () {
      final address = PostalAddress('90619-900', 'Avenida Ipiranga, 6681', '',
          'Partenon', 'Porto Alegre', 'RS', 'Brasil');

      expect(address.code, '90619-900');
      expect(address.place, 'Avenida Ipiranga, 6681');
      expect(address.complement, '');
      expect(address.district, 'Partenon');
      expect(address.city, 'Porto Alegre');
      expect(address.state, 'RS');
      expect(address.country, 'Brasil');
    });

    test('Address using a code implicitly from Brasil', () {
      final address = PostalAddress.inBrazil('90619-900', 'Avenida Ipiranga, 6681',
          '', 'Partenon', 'Porto Alegre', 'RS');

      expect(address.code, '90619-900');
      expect(address.place, 'Avenida Ipiranga, 6681');
      expect(address.complement, '');
      expect(address.district, 'Partenon');
      expect(address.city, 'Porto Alegre');
      expect(address.state, 'RS');
      expect(address.country, 'Brasil');
    });

    test('Address from json', () {
      final String example = '''
      {
        "cep": "01001-000",
        "logradouro": "Praça da Sé",
        "complemento": "lado ímpar",
        "bairro": "Sé",
        "localidade": "São Paulo",
        "uf": "SP",
        "unidade": "",
        "ibge": "3550308",
        "gia": "1004" 
      }
        ''';

      final address = PostalAddress.fromJson(json.decode(example));

      expect(address.code, '01001-000');
      expect(address.place, 'Praça da Sé');
      expect(address.complement, 'lado ímpar');
      expect(address.district, 'Sé');
      expect(address.city, 'São Paulo');
      expect(address.state, 'SP');
      expect(address.country, 'Brasil');
    });
  });
}
