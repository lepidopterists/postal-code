// Copyright (c) 2020, the Postal Code project authors.  Please see
// the AUTHORS file for details. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:postalcode/main.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Postal code find smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => AddressModel(), child: MyApp()));

    // Verify that our counter starts at 0.
    //expect(find.text('0'), findsOneWidget);
    //expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    var byKeyCep = find.byKey(ValueKey('field_CEP'));
    var byKeyFind = find.byKey(ValueKey('button_Find'));

    await tester.enterText(byKeyCep, '90619-900');
    //await tester.tap(byKeyFind);
    //await tester.pump();

    // Verify that our counter has incremented.
    //expect(find.text('Ipiranga'), findsOneWidget);
    //expect(find.text('1'), findsOneWidget);
  });
}
