import 'package:flutter/material.dart';
import 'package:pays/Screens/Country.dart';
import 'package:dio/dio.dart';

class AllCountries extends StatefulWidget {
  AllCountries({Key key}) : super(key: key);

  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  Future<List> countries;
  Future<List> getCountries() async {
    try {
      var response = await Dio().get("https://restcountries.eu/rest/v2/all");
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    countries = getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('Liste des pays'),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: FutureBuilder<List>(
                future: countries,
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Country(snapshot.data[index])));
                        },
                        child: Card(
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            child: Text(
                              snapshot.data[index]['name'],
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      );
                    });
                  }
                })
            // ListView(children: <Widget>[
            //   GestureDetector(
            //     onTap: () {
            //       Navigator.of(context).push(
            //           MaterialPageRoute(builder: (context) => Country('Bénin')));
            //     },
            //     child: Card(
            //       elevation: 10,
            //       child: Padding(
            //         padding:
            //             const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            //         child: Text(
            //           'Inde',
            //           style: TextStyle(fontSize: 18),
            //         ),
            ) //       ),
        //     ),
        //   ),
        // ])),
        );
  }
}
