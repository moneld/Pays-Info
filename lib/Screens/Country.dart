import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  final Map country;

  Country(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(country['name']),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            CountryCard(title: 'Capitale'),
            CountryCard(title: 'Population'),
            CountryCard(title: 'Drapeau'),
            CountryCard(title: 'Monnaie'),
            CountryCard(title: 'Continent'),
            CountryCard(title: 'Afficher la carte'),
          ],
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;
  const CountryCard({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
