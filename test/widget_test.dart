// Copyright (c) 2020, the Postal Code project authors.  Please see
// the AUTHORS file for details. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

import 'package:postalcode/main.dart';
import 'package:postalcode/postal_address.dart';
import 'package:postalcode/postal_address_provider.dart';
import 'package:provider/provider.dart';

class MockPostalAddressProvider extends Mock implements PostalAddressProvider {}

MockPostalAddressProvider provider;

final address = PostalAddress('90619-900', 'Avenida Ipiranga, 6681', '', 'Partenon',
    'Porto Alegre', 'RS', 'Brasil');

void main() {
  setUp(() {
    provider = MockPostalAddressProvider();

    when(provider.fetchPostalAddress('90619-900'))
        .thenAnswer((_) => Future.value(address));
  });

  testWidgets('Postal code find smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => AddressModel.withProvider(provider),
        child: MyApp()));

    var byKeyCep = find.byKey(ValueKey('field_CEP'));
    var byKeyFind = find.byKey(ValueKey('button_Find'));

    await tester.enterText(byKeyCep, '90619-900');
    await tester.tap(byKeyFind);
    await tester.pump();

    expect(find.text('Partenon'), findsOneWidget);
  });
}
