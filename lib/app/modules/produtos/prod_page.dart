import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:resto_controller/app/components/cad_widget.dart';

import 'package:resto_controller/app/modules/produtos/prod_controller.dart';

class ProdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProdController prod = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Produtos',
          textAlign: TextAlign.center,
        )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed('/cad-prod');
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: prod.count2,
        itemBuilder: (context, i) => ProdWidget(prod.byIndex(i)),
      ),
    );
  }
}
