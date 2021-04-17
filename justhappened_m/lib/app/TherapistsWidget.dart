
import './services.dart';
import 'package:flutter/material.dart';

import 'domain.dart';

//
class TherapistWidget extends StatefulWidget {
  TherapistWidget({Key key}) : super(key: key);
  //zwraca widget ktory dziedziczy po state
  @override
  _TherapistWidgetState createState() => _TherapistWidgetState();
}

//
class _TherapistWidgetState extends State<TherapistWidget> {
   Future<List<Therapist>> futureTherapists;

  //metoda do ładowania stanu widgetu (danych do widgetu)
  @override
  void initState() {
    super.initState();
    futureTherapists = fetchTherapist();
  }
  // odpalany kiedy wykryje zmiany we Future
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Therapist>>(
        future: futureTherapists,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildPage(context, snapshot.data);
          } else if (snapshot.hasError) {
            print("Error while loading therapist: ${snapshot.error}");
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Widget _buildPage(BuildContext context, List<Therapist> entries) {
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return Padding(
            padding: EdgeInsets.all(16.0),
            child: _buildEntry(context, entries[index]));
      },
    );
  }

  Widget _buildEntry(BuildContext context, Therapist entry) {
    return Text(entry.name);
  }
}
