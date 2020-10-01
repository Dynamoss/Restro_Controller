import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:resto_controller/app/components/forn_widget.dart';

import 'forn_controller.dart';

class FornPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FornController forn = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Fornecedores',
          textAlign: TextAlign.center,
        )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed('/cad-forn');
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: forn.count,
        itemBuilder: (ctx, i) => FornWidget(forn.byIndex(i)),
      ),
    );
  }
}
