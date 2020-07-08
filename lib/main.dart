import 'package:flutter/material.dart';
import 'package:postalcode/postal_address.dart';
import 'package:postalcode/postal_address_provider.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
      create: (context) => AddressModel(),
      child: MyApp())
  );
}

class MyApp extends StatelessWidget {
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class AddressModel extends ChangeNotifier {
  PostalAddressProvider _provider = PostalAddressProvider();

  PostalAddress address;
  void update2(String code) async {
    address = await _provider.fetchPostalAddress(code);
    notifyListeners();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();

  void _update() async {
    print('_update');
    print(_controller.text);
    var model = Provider.of<AddressModel>(context, listen:false);
    model.update2(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
            ),
            Text(
              'Endereço:',
            ),
            Consumer<AddressModel>(builder: (context, model, child) {
              return Text('${model.address}');
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _update,
        tooltip: 'Consultar',
        child: Icon(Icons.location_city),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
