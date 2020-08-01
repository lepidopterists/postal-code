// Copyright (c) 2020, the Postal Code project authors.  Please see
// the AUTHORS file for details. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:http/http.dart';

import 'postal_address.dart';

/**
 *
 */
class PostalAddressProvider {

  /**
   *
   */
  Future<PostalAddress> fetchPostalAddress(String code) async {
    Client endPoint = Client();
    final response = await endPoint.get('http://viacep.com.br/ws/$code/json/');
    if (response.statusCode == 200) {
      return PostalAddress.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load owners for $code code.');
    }
  }
}
