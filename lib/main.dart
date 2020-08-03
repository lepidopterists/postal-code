// Copyright (c) 2020, the Postal Code project authors.  Please see
// the AUTHORS file for details. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:postalcode/postal_address.dart';
import 'package:postalcode/postal_address_provider.dart';

import 'package:provider/provider.dart';

/**
 *
 */
void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AddressModel(), child: MyApp()));
}

/**
 *
 */
class AddressModel extends ChangeNotifier {
  /**
   *
   */
  PostalAddressProvider _provider = PostalAddressProvider();

  /**
   *
   */
  PostalAddress address;

  /**
   *
   */
  AddressModel.withProvider(this._provider);

  /**
   *
   */
  AddressModel();

  /**
   *
   */
  void update2(String code) async {
    address = await _provider.fetchPostalAddress(code);
    notifyListeners();
  }
}

/**
 *
 */
class MyApp extends StatelessWidget {
  /**
   *
   */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta de CEP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Consulta de CEP'),
    );
  }
}

/**
 *
 */
class MyHomePage extends StatefulWidget {
  /**
   *
   */
  MyHomePage({Key key, this.title}) : super(key: key);

  /**
   *
   */
  final String title;

  /**
   *
   */
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/**
 *
 */
class _MyHomePageState extends State<MyHomePage> {
  /**
   *
   */
  TextEditingController _controller = TextEditingController();

  /**
   *
   */
  void _update() async {
    print('_update');
    print(_controller.text);
    var model = Provider.of<AddressModel>(context, listen: false);
    model.update2(_controller.text);
  }

  /**
   *
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    labelText: 'CEP',
                    hintText: 'Código postal',
                    icon: Icon(Icons.mail)),
                controller: _controller,
                key: ValueKey('field_CEP'),
              ),
              Consumer<AddressModel>(builder: (context, model, child) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.place),
                          Text(model.address == null
                              ? ""
                              : "${model.address.place}"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.my_location),
                          Text(model.address == null
                              ? ""
                              : "${model.address.district}"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_city),
                          Text(model.address == null
                              ? ""
                              : "${model.address.city}"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.flag),
                          Text(model.address == null
                              ? ""
                              : "${model.address.state}"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.outlined_flag),
                          Text(model.address == null
                              ? ""
                              : "${model.address.country}"),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: ValueKey('button_Find'),
        onPressed: _update,
        tooltip: 'Consultar',
        child: Icon(Icons.location_city),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
