import 'dart:convert';

import 'package:http/http.dart' as http;

Future fetchFromApi(String apiPath) async {
  final url = Uri.https('miloszlewandowski.pl', apiPath);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final responseData =  jsonDecode(response.body);
    print(responseData);
    return responseData;


  } throw Exception('failed to load from api');
}