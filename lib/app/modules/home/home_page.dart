import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                'Bem Vindo Ao Resto Controller',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 100,
              ),
              child: RaisedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed('/forn');
                },
                icon: Icon(Icons.add_location),
                label: Text('Fornecedores'),
                color: Colors.lightGreen,
                elevation: 20,
              ),
            ),
            RaisedButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed('/prod');
              },
              icon: Icon(Icons.add_location),
              label: Text('Produtos'),
              color: Colors.amberAccent,
              elevation: 20,
            ),
          ],
        ),
      ),
    );
  }
}
